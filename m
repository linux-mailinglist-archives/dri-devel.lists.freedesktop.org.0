Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3AAB5B4A
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBAF10E279;
	Tue, 13 May 2025 17:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="S7zmfzLA";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aJX+EdP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA1110E279;
 Tue, 13 May 2025 17:29:59 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHKK6018754;
 Tue, 13 May 2025 17:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=sHuxUNOY3/+6VtBZLC
 2CMay7Cxs6BRkG9XVx7wu7xBA=; b=S7zmfzLAyUFPfqfcDSkYrUJT3nQcv/evye
 KjWD/sGX24o8/pDCEqphScViShv4ILtlfeUA6XYkfP+lcHfGc4xeGBIl8qvo+3S8
 HaTUrw2v1+BPUYgsMWzv5NJO50EI9ELNsL0oEj2oQaU4TkXYEZJ84eBhmve8e9i/
 LmccT1xuYdNdzhSRc+g3xhD6S69IREMkhV1K9hK23WJlH+x5cPG8F5OGTzuFdJyt
 6voE/ECupKQqJXMut+xEL7yXjut0Bm9fNNYgIAfIUCBSFE7jPSYgDAAopB5oDAH5
 km5+wFw8lw+dPCRIRjs85axu2P131Abx1SNsphYLI6dS5Kg/mb6A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwne63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:29:35 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DGFJkX004051; Tue, 13 May 2025 17:29:34 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazlp17010006.outbound.protection.outlook.com [40.93.11.6])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m8an78g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:29:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWQgi/HDzYZxcpxIhTb7StrJ4kfHlj34YFaE3k0a0BjwmLZMVLOTM5IkMC7clNgaQlZY2r6aWO03zImX9B13gQMISz10puU2OAR+7O/m2xefWgFCOCmkGVrOC1NgZzy0Ce9bSzZ0IDMoN5rTfJWoso3HAcaBMVbwpJtaKj42ILQqDKF1AwRGZ8Gg+EhZzifVJ4ERbONZ9y5+nd+h1RnsJFnQqvXwU7kqEiZgj4wQedhpkfH46dqQqukVxqCNvX8cFl0eDQ9gPNpzeHwjBzjrNNC6ro1hCEEOApyueee0dAmqtdIxSzGEndhka9tm3ftuqodq/k92apB+57qe2ltP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHuxUNOY3/+6VtBZLC2CMay7Cxs6BRkG9XVx7wu7xBA=;
 b=WFp+C6p5O5YAYhv5GxUckwv77YIKhFzCfcdU4b43FXI8b0BoUcbjJHiC3ikieSoJOPjVX5gkSJB1d29JGLSdTHUJb+f+wDaIdFl35kyrwUlH/f1cPZ6MYYoUcdssoEMAsqwTs33V2VP+J31HPYuNk3TGt2nSRdbxu4Tka6MUx3QUGuvK6NKbebYXkEacrB01dPLjSf4P0WdfcT+FekiJVnZQCIUceOhh6F3zqWrEj0SIVxGtQglnCnoDcxtzwRXfeQjJtzDnKwcSqPXIJ872n23WWvsDAEe2raZXooG+Sq4BAfJUTyIxZ/oYnLRWL6uuWclPijWVMpsQ1z9qc5UHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHuxUNOY3/+6VtBZLC2CMay7Cxs6BRkG9XVx7wu7xBA=;
 b=aJX+EdP+u1J0jjwmep06E3gjnCu8HjWEux9K3TXZ3nJe6tgkqdD3DXmDde1ZQS2YvF/6ubc9go/0JBV1LTD2ygcTwgfP7ZlNFQOYE1TPK4iGP0ON/VBcUuVmc+rlcmnj8R2Se4QwQmNVnkXxdLB7lseF5bab2KZUGAec4VqrrOQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS7PR10MB4991.namprd10.prod.outlook.com (2603:10b6:5:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 17:29:31 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:29:30 +0000
Date: Tue, 13 May 2025 13:29:25 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 02/11] mm: convert track_pfn_insert() to
 pfnmap_setup_cachemode*()
Message-ID: <tov2v673eubzfewziz3kfq7sj7ezytzpcblxeqyg4lgpphyywf@xgbzdbapvshw>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-3-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS7PR10MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: bb800154-403a-4285-31d2-08dd9243b802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?obIkYQ9dboZ30wYcMrVtcMttL2nrkOGRm9DyWSQTJaZWe+ljrF+3TwK4MXlx?=
 =?us-ascii?Q?3j+v2Q9Vwn7Q40km99yIFothvpV//trZVZViEMnJipRIitqLMmBesAdhCFk0?=
 =?us-ascii?Q?m4cXFzaxEqBU0xModeCeU+bADEmOfOy/3/LN9BPizUhc08Rq/sAQ0wqqrwKm?=
 =?us-ascii?Q?OxabQTjys+9z8DDNquUzsA6fZ5JHJMdg1ti59zLhjf9wkziIqzGKcV24wYBG?=
 =?us-ascii?Q?r+J02J+MiWOZrIGSsOwO4luqEkDDy0c6QIhYfhbi40zHC/BegcTI4iOgBWKG?=
 =?us-ascii?Q?diaaNA/z+UQ4qn9LWRatsiqyYMHHKt/bvWSF9c6/Z+gZ22ijtzJqsDGE9YtQ?=
 =?us-ascii?Q?l+2nMtYqr6jho0JPWRsP5TV8rdtdCapai3FhUrpweQGnAOhz9HEI0L7Rlqmm?=
 =?us-ascii?Q?WlO7EjrWF9waXBiESmI6qj9MxPjb6HN5S4vr/OL6Uhpr7ir6z5kdbKPFolWo?=
 =?us-ascii?Q?WShvI8HvoyxieIzPRQzjfkk7jvVEmdAqYJ7iyIMjuRYRc/pbXJC8QSq3h9gq?=
 =?us-ascii?Q?c/ysh/BJGmgv+zoGhY2JxiZ2JGLW7s8dqRFiFAEdXQVIUr6Ehd5tLd6wfNoe?=
 =?us-ascii?Q?erBwlS94LDPL1SqEDy6YucCajnDEVP54f3uzObImUI39nMJZxLOi9ze4GaSG?=
 =?us-ascii?Q?A83qa+sQPtdxcLTHYFfRswbPHM9Zwp6Y/RDyou/KVC4q+yHaQnosnS2GL48q?=
 =?us-ascii?Q?K5pXGSpyHIzEHyGwmAVAF0AvN9iaZTGG4ARC6Jr2Y3t3Uc7Ogbw0XdW/1NJw?=
 =?us-ascii?Q?1/mRx6tT82Tzha/6Fubesmnxvds5Tpb7Jh7MHQXEOcaHaHza4CHWKmaDDryX?=
 =?us-ascii?Q?6erpePQoG1I1UySYIiglEZlJBdPt6ELRJ38QN2LX27JFht7luWaBShxy6veG?=
 =?us-ascii?Q?j2CQ+rLSgqOtvUZl+bkia17oepBrMWYPXw4zsJt2S7/5f4B6kSMcBOtf9gpv?=
 =?us-ascii?Q?3ujH5kQSzcYxzK5V7C/CT+3CBn+35jc4sCLTcL2QwGO1OqnaEvXITmjklwkQ?=
 =?us-ascii?Q?jeOnPo5+XDUCasvoaoIg8so/Zc919SctLrySPqxL0VmEJMwKwnK0BR6f0PnB?=
 =?us-ascii?Q?tPhb5q6RsWzdmxJWTbe+o5Xuuzo020VrWP3H1uBYyZD/w+POonk0MCi+Mb6q?=
 =?us-ascii?Q?SMA87NZLC4lclTFdYOVjIfUTPyI0XQbG3HEdoHz8WrxTd4iMyZWvvhQ8hWoC?=
 =?us-ascii?Q?FWMh3GYdBSUH6aGhi42XCbYrQEcn3u+ET1m7+NtEJgWf4KbIUlwCQq8+Ai6I?=
 =?us-ascii?Q?BvHRm9GSYrJnNpIBKFPm5VQ0UGON6tsaExqOHIyVO4VrcD51exFUOC79eGJE?=
 =?us-ascii?Q?j8fZgBMwJ7iw2pwpCApRp36emjLH0/lNt2DGU//e9gCLgn0kbE28aaoN1lP0?=
 =?us-ascii?Q?8kH6Cn0Uf2402vUh47W3ynKUWL8vh3eUk1xGQS3dx3sH/tNtb6rMM7/B0DcA?=
 =?us-ascii?Q?MpNUM86U0HtAfBd25pfol2I+Xw/5aAJvqNxmbiGLb5vik/ydnzJ2eg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjs/dSeZG5hi6IkWY+1i2w9Eov2+DSpcIcERBf9QW8P47qyA4o8qWRO9Sptv?=
 =?us-ascii?Q?OBKKGKu5pijzt8lYa7y1vsII0btVdiKZSjkvKJK63XPfGN2ESMKCTg1DVDGn?=
 =?us-ascii?Q?C1gjXpi9STrpP06rpPHPNKksAGdxGQ5vRMYUPNRkBpp9VhIvZVbFTEoVChe0?=
 =?us-ascii?Q?07rSwV8UPliAtCb6m7lLRZ1r8C+IIWdv7TtMHJIxS0YPi5E1x02+VXYP4TfJ?=
 =?us-ascii?Q?z13RKkt1pQ4DtCmC2zEAa99FnzxYs0YpbYFHkmryZS5ZlLvfz72cqm+m9lhC?=
 =?us-ascii?Q?z4xd+xEWYy1OqCovRfDklbbnSxDua8SbrPuOutIhvkUGCYmlcwFQPbItaf7a?=
 =?us-ascii?Q?2XDwmZYGaOk2SvodfhYBNBO4Sw895sOv1rGPiw9/MEBu0w97yNZLIKojqoCV?=
 =?us-ascii?Q?J/iiLOAkYKz6r4vBxgo7KrvwyEAunsG8l1RpdHBRBbJc4LySjyBO4UzQAyka?=
 =?us-ascii?Q?EucHXhEi9tKCLljgNDHSJ0ozensBabSE+jnmHTa1TH3Vg88MmW0LBum8qLP4?=
 =?us-ascii?Q?8zUv6saFh2X5ghQx9R7GPmuz6qap0ncbSqxqRGcDLP3IPOfVKLh78LcNdmOV?=
 =?us-ascii?Q?jtfUXo71Xf6xx/yCN5StFo/C3fsvM3ighgDdHwannVQmo9TNTha+ZfsLBLSh?=
 =?us-ascii?Q?e47hf+M6D4kkcD7K9mHUpRfoaSlwET5SXcDjFrePTE3qBJInKAGpItcfPcWP?=
 =?us-ascii?Q?iULPnSfveFp65jEW9isFXv+yeumdJCXEoZvonKeo1MQW29IZi0M8UE2sToZs?=
 =?us-ascii?Q?VHAXt0eZbKh6BW8XH8tazgDgEwkFTblntBWT/UiYY+ONwGYSmC6QknU5HH3F?=
 =?us-ascii?Q?gg+q/NiX4CjREDJes86V2rb3pvAiFW0e+RL6Bu5j8TGGjZl6MdRgcB44014e?=
 =?us-ascii?Q?G6NNpEOFFleOX19eAVLGhHMXnb2o5ILznazeIKIrtuoUuumZcEr71RyUgpyc?=
 =?us-ascii?Q?g/vxYW37XbWKsWZHszweC2AbPuj/BgWQzlsA+VaYAZFtIDtsSDXbmgU1XCk9?=
 =?us-ascii?Q?K2z7Jd13L1Pl7YMxS2I4l68srZuXtfiO395gd/N7m1iw+H9lPmXnEO1u72P0?=
 =?us-ascii?Q?NrPxF6Jx/6TJUnTetcXL9kBnKiLTvDhyBXQLmtlEp0lW1yY08OdHWw+7TIsj?=
 =?us-ascii?Q?ayjx/B0izocClKBVUSHQ5tXQrPrDs/m0QuyMhgReYSDyzYar+bUrAVsNJD4N?=
 =?us-ascii?Q?8c+5fNl1gfZrQ8o5GsyWApc7iOi2YFiXgbLZoo3ABy9VzydmfuXNpNmD35Eg?=
 =?us-ascii?Q?mNYuQ/fLT7DU70p3RaI63ZfWzLshh78M/KzH0MTRKUGpqGNej48JkOqmuUMx?=
 =?us-ascii?Q?ghI3oyaBE0pFCfQL86oMZvyMcvpNfW7rq+JX5y+JiLtV21DDfhsum+gpa0bR?=
 =?us-ascii?Q?nWLe2sN++gBTH/nnqwdVAtaMxPJFf3U1KmJrpYTXPquGuWMqspkYSelog33d?=
 =?us-ascii?Q?dovzX2uu1FMwzeNHCPshdsRfvZPmlopPFjnSRaS+FBpnlQLyA5o9FbZoUZkF?=
 =?us-ascii?Q?6dM2dpa9wnNHEAs6h8wzIcJiUklNceJO6wTrO0R0rrW2i5kI0rxHSeqkiW7B?=
 =?us-ascii?Q?cjGMw+S/jP6A0avD3cjPklJrdFWtuSK/rS+AFSyc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: d11rwXEtwVCbktTJOb8zr1mLPVULfUzdcBCaVVOHTrAMzMosoHeR7i3o21G79ICLs/5yZu0sleb3blvicpcElL//909VQUnmtuxgJ1qq9Cgx5jAbe9jNQSEAgqraTIuR+yF6lCk8aT9Q0sUeMPNzQYWWSD3yK/R/qIfvV4dMKpEuF8TEO+BhM8+Vm7pthm/MtA2rR7VX1xxwj2LNt6gG0ov6raOYsmqb68ZpjbSqpk+S3NuoqY1MzFuzyff+grChzxsqy5taCVGMNij5UYTuuURUFz1jVAh5qfK5/ec5rWnGgr5QJU3zZBzEA/vRNl7/J5sMeIqG+XCoWfXGlDtGBcVSZVZeSDoyWlVHJ3ygRsi2e9T+7jIaFEixTde0DU01Tu4NUXyfGIfQ3t6qdHZtrUZFKODpjVTG8Iuqj7Mn2PejwbNsvKkjuvaEkjgyNz4m9YH2TxfwkJ3gFM0iWgLWvrUjzB7PrkJC6VkE9+Ai8Q8ER4HBP5vw0MbZv/+UmZ80KQWDojcxzVeBJD+gf7CVHhQKAfdFdcfEQEmU6RWHct4+nuknp/+e5JJCZZXusYQyGjbGciHR14OhBKzHNE1cPgv5806Ti8X24l4L0SROIec=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb800154-403a-4285-31d2-08dd9243b802
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:29:30.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6NddbjDOPESm2d05/UXagneLXhQ//4DDd/C0IyBTYpmS7dScPwY8AWthaXnrmmBu1DtIDMRKSciwAWOoylY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4991
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130166
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=6823817f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=dohQ5Pe4HFVHix1OcWsA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-GUID: kctdLX6kC5mJmnIa_Z9XPAv2ApFZFqza
X-Proofpoint-ORIG-GUID: kctdLX6kC5mJmnIa_Z9XPAv2ApFZFqza
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2NiBTYWx0ZWRfXzDhlyUiifeVQ
 HAK7WQdHKKxKp76nptnhqkqmoFhCEXKLAbGirf4AyUTysQpFdPYrMvkqS2u0em/o78iZhh4tIu0
 OizLshqDfHThC6rYAiWOB+Mkyv9wgYK96JmyONWvZ11WwTO70jrL1ba+tMul6zewBbiR4TvmBAx
 SSxl4wxhjisnKyKZ8Z8AEqIyWQ2D8Jo4NXF33yDVQzRhfFY1akbZ4tS8mefRj+gigsWBnJpiSPp
 o7fbBU542VxJPeIBWCvbl3oNZT/6nuqTMJhEwQiEG5VT7NNnOVC0t+/iWT/Fgc4EomFi5XJxMa/
 5B5oLMe286PaHeocDlTcTfBTQKrkb2eq/sQpNcKNAFqcEWEYgZ7L9zLnRCt2GebxpQpEsIh2B39
 +/ySjKZyhN/eUlZHbnWV5xzEdn8T3HQML8yNQfI9F5GiTn/SvRs+6qIZ/S1VlGpUqly88S9Z
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* David Hildenbrand <david@redhat.com> [250512 08:34]:
> ... by factoring it out from track_pfn_remap() into
> pfnmap_setup_cachemode() and provide pfnmap_setup_cachemode_pfn() as
> a replacement for track_pfn_insert().
> 
> For PMDs/PUDs, we keep checking a single pfn only. Add some documentation,
> and also document why it is valid to not check the whole pfn range.
> 
> We'll reuse pfnmap_setup_cachemode() from core MM next.
> 
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 24 ++++++------------
>  include/linux/pgtable.h   | 52 +++++++++++++++++++++++++++++++++------
>  mm/huge_memory.c          |  5 ++--
>  mm/memory.c               |  4 +--
>  4 files changed, 57 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index edec5859651d6..fa78facc6f633 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -1031,7 +1031,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  		    unsigned long pfn, unsigned long addr, unsigned long size)
>  {
>  	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -	enum page_cache_mode pcm;
>  
>  	/* reserve the whole chunk starting from paddr */
>  	if (!vma || (addr == vma->vm_start
> @@ -1044,13 +1043,17 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  		return ret;
>  	}
>  
> +	return pfnmap_setup_cachemode(pfn, size, prot);
> +}
> +
> +int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot)
> +{
> +	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> +	enum page_cache_mode pcm;
> +
>  	if (!pat_enabled())
>  		return 0;
>  
> -	/*
> -	 * For anything smaller than the vma size we set prot based on the
> -	 * lookup.
> -	 */
>  	pcm = lookup_memtype(paddr);
>  
>  	/* Check memtype for the remaining pages */
> @@ -1065,17 +1068,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  	return 0;
>  }
>  
> -void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
> -{
> -	enum page_cache_mode pcm;
> -
> -	if (!pat_enabled())
> -		return;
> -
> -	pcm = lookup_memtype(pfn_t_to_phys(pfn));
> -	pgprot_set_cachemode(prot, pcm);
> -}
> -
>  /*
>   * untrack_pfn is called while unmapping a pfnmap for a region.
>   * untrack can be called for a specific region indicated by pfn and size or
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f1e890b604609..be1745839871c 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1496,13 +1496,10 @@ static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  	return 0;
>  }
>  
> -/*
> - * track_pfn_insert is called when a _new_ single pfn is established
> - * by vmf_insert_pfn().
> - */
> -static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> -				    pfn_t pfn)
> +static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
> +		pgprot_t *prot)
>  {
> +	return 0;
>  }
>  
>  /*
> @@ -1552,8 +1549,32 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
>  extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  			   unsigned long pfn, unsigned long addr,
>  			   unsigned long size);
> -extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> -			     pfn_t pfn);
> +
> +/**
> + * pfnmap_setup_cachemode - setup the cachemode in the pgprot for a pfn range
> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range in bytes
> + * @prot: the pgprot to modify
> + *
> + * Lookup the cachemode for the pfn range starting at @pfn with the size
> + * @size and store it in @prot, leaving other data in @prot unchanged.
> + *
> + * This allows for a hardware implementation to have fine-grained control of
> + * memory cache behavior at page level granularity. Without a hardware
> + * implementation, this function does nothing.
> + *
> + * Currently there is only one implementation for this - x86 Page Attribute
> + * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
> + *
> + * This function can fail if the pfn range spans pfns that require differing
> + * cachemodes. If the pfn range was previously verified to have a single
> + * cachemode, it is sufficient to query only a single pfn. The assumption is
> + * that this is the case for drivers using the vmf_insert_pfn*() interface.
> + *
> + * Returns 0 on success and -EINVAL on error.
> + */
> +int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
> +		pgprot_t *prot);
>  extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn);
>  extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> @@ -1563,6 +1584,21 @@ extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>  extern void untrack_pfn_clear(struct vm_area_struct *vma);
>  #endif
>  
> +/**
> + * pfnmap_setup_cachemode_pfn - setup the cachemode in the pgprot for a pfn
> + * @pfn: the pfn
> + * @prot: the pgprot to modify
> + *
> + * Lookup the cachemode for @pfn and store it in @prot, leaving other
> + * data in @prot unchanged.
> + *
> + * See pfnmap_setup_cachemode() for details.
> + */
> +static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
> +{
> +	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
> +}
> +
>  #ifdef CONFIG_MMU
>  #ifdef __HAVE_COLOR_ZERO_PAGE
>  static inline int is_zero_pfn(unsigned long pfn)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2780a12b25f01..d3e66136e41a3 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1455,7 +1455,8 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>  			return VM_FAULT_OOM;
>  	}
>  
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
> +
>  	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>  	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
>  			pgtable);
> @@ -1577,7 +1578,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
>  		return VM_FAULT_SIGBUS;
>  
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
>  
>  	ptl = pud_lock(vma->vm_mm, vmf->pud);
>  	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
> diff --git a/mm/memory.c b/mm/memory.c
> index 99af83434e7c5..064fc55d8eab9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2564,7 +2564,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  	if (!pfn_modify_allowed(pfn, pgprot))
>  		return VM_FAULT_SIGBUS;
>  
> -	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
> +	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>  
>  	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
>  			false);
> @@ -2627,7 +2627,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
>  		return VM_FAULT_SIGBUS;
>  
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
>  
>  	if (!pfn_modify_allowed(pfn_t_to_pfn(pfn), pgprot))
>  		return VM_FAULT_SIGBUS;
> -- 
> 2.49.0
> 
