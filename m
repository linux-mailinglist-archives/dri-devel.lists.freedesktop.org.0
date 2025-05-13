Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B8AB5BA1
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845DA10E290;
	Tue, 13 May 2025 17:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Hd8da6i1";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rGubYJEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956F10E290;
 Tue, 13 May 2025 17:49:18 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHJgo031819;
 Tue, 13 May 2025 17:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=lG5bH/lVUCEe0My2uD
 IAxakyCchChulihs/cPYTrU4w=; b=Hd8da6i1uto0Hkst/kmBHRIUNNKLd8pdoH
 5cUUbR+HLZZlSHe7m63ASWamUQY1vFf/Z6c0PgwfUIlYZJldmLBe3aL1B/Yp6Uch
 2ETxo42AxVPIHJ0moofwKuMyW2RbCbJ99mgPSIs9wnhVoVpMyyDl0sNEB3scPRqZ
 iUyAO+r1UsfpKdS7UwGiqgkikh/lueeE5j+vH3I+BVAkz02TjF6/8WQYsdI5eH3n
 gyFDm6ZTdh5cMRmqOtISlj5nxKuqn9jfAzBfDDKRo8KEcH0NUPxCTUS+eC/yMyGO
 9Fq9TmF7+nyGlt/FQF5LDm+/Yj/xQya+M4CgCYOwl/W0v1hbcqcQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1jnnggv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:48:48 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHUf2f022301; Tue, 13 May 2025 17:48:47 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17010002.outbound.protection.outlook.com [40.93.6.2])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw8a1ywj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwYbuhcujHCHMtJOPEdYoK+6xJkgty0wKG0gUmf7jazf9kZ9vM32s/JfsHkz2h6Vp4+U4ekCuxCPSfmGVX3vv8u2Ax8oOBhBywor56W9Fh874faQdBQpkJxd14BKmq3Za36wpitADndKpcUllDi2vX2W1kHfEQkkW9xTuNUyXnVF8TP74hdiLWqMx0Hq9yc/FHhdLhF7EnX0AKU3JGzLlO6ZOfJ9K1Y8/kqHAm8C0YquzqEHX7cnb8LrmGrrD6udaNygsmFJLqEGZO02f+nyDDl0hFzxNtuQtISylWDQjoBQ6HmB0o6s55ZSc5j1TyKNVwr5p+HKGgn73eCyZTHDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lG5bH/lVUCEe0My2uDIAxakyCchChulihs/cPYTrU4w=;
 b=Zu7Ys9+2+OQKr0/2VlMhuV6rlD3I76Sn7E2Ce8RxSPg8VzzaJJg0Up3gtZGyQ/jOxi5RSQj/aX/cjFG9x8ZJbvJ190XwwcIouS2MqHr3Xt4+FlB+otOmtaxeZmiorjLPeBGl7KNhyw0opIxpVtaW0OxrU8y84E9Rs+6zJC4fG+zM3eVZSYvXKlMWREZ6O3JgPEjLZRAJpmUVL8HX7gINSin/dIdfztxy9cFbj8WYZyRk1c7KgV8dpmGXJOvXXUqaAh9k1r9gEqzp8+AykZU29oXEmzITPlDVXmYUHNMIlLchEgbONnjNofADdDnyJ7y1dNmXXfZ70Cbk0io4UhAuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG5bH/lVUCEe0My2uDIAxakyCchChulihs/cPYTrU4w=;
 b=rGubYJEY+/GGg3H2UMbqsLbpiOYwWvRj8dbrG+zkTUFpxfNcG1FKLYQn4DyBS0UqjKemQSiKJoFRoqYX66GTo09Flh3tzJUAuoucfVn/vHwLxA6ceUO69iec1CDVz4fMfiuoTu1x6a+P0G8iSoBMRGo4/0Yb5uvLR3L7LDbnPTE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5860.namprd10.prod.outlook.com (2603:10b6:a03:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 17:48:45 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:48:45 +0000
Date: Tue, 13 May 2025 13:48:38 -0400
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
Subject: Re: [PATCH v2 08/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Message-ID: <f2bxgy5tmb3cpk457lay3hl4wejj5dvttswnvzi2uudxtkkbsm@ktcytlgv64nn>
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
 <20250512123424.637989-9-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-9-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::34) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: ea637b68-2e6b-4ab9-77d6-08dd9246681b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jqn2/jIK+jgoJyvsU9m9PVuyetFoRX9FGQq2/s4L6wj3OpUyUoSD9B5YE3v7?=
 =?us-ascii?Q?EqFHPSTvKRMpYcf2CqT+NHAFsBvA5R9M/4bpaJDOPYOgnOmSgXOwhngM4vON?=
 =?us-ascii?Q?ehnlj2Tmw/m7MWLAS8mNBrzcHqLGB4pmVO899clL4+k2C6HIGER5DvHyVn8m?=
 =?us-ascii?Q?tG4jyYKiJTMr872CIyqKMAVSdR4Zk3FuLH2WpSL2e9PS5QBBlKN5vVbqqXcr?=
 =?us-ascii?Q?U2UPW5R3MkHkSk7qR2PbCb2R+RsskWlBLaSf3T47lZhTXRapEvtXG0q2T6gh?=
 =?us-ascii?Q?W0Yz69nGve2AuProMDxrIBHnD9r/6rcmPq5kxbowEezQQVWzWRihlMpKKq2A?=
 =?us-ascii?Q?LE0S54EqOBgOhBu8TyyQcVCtFg3xMXEWknpIbJESA9Of3ixITxLtEGPTN6HJ?=
 =?us-ascii?Q?w7HaUhn9gnzV1UUwlyT57se2tZNNPjXSeY7lwA2sODCHpXJ2qxmCwaVPnn1S?=
 =?us-ascii?Q?2imQvDvtUYoqUgKiFCh5Ub6JgsnJSEgnA5sigzNFBj3ZxpPdgVeDyg/Zy1fc?=
 =?us-ascii?Q?WvFWz1EUtedzaeiP/NOz0ycwbWr17DgVnxeFrRPKLpd5t5SrRgbblDcgBN1D?=
 =?us-ascii?Q?o4Tb+N7B7yzZgwl35QBHLPM27bFvjbNQv+U0/mjYvdVtWmiN3kM/sfaNVsex?=
 =?us-ascii?Q?MC30+EnAkNBhpR+yrm5WI5T7c5fg/jhRCjtMfbRA6NrqVAxYULnP3h4SSvg0?=
 =?us-ascii?Q?2ysW7kWOT6ry10cykNGeMcYwUjz/HEG7gamhJBMECHaWG3zS+fIVz7G1eMBT?=
 =?us-ascii?Q?fOf2e303tfyZHCVbPFcdpx6I3BdR9we7/bE6B9KkDfWNuhmk+kxh5CX6SNv3?=
 =?us-ascii?Q?yJJEmum++QRzZ58ORrFPhUZYa/4aQDfz+0o/pt9PHaZvn6qWo72IlBlLnA69?=
 =?us-ascii?Q?wWWjcRIriSR2meEwnkZRqU42ohHCAFrx7D5brY+4lcwV+gGb6F30Zp0z5l20?=
 =?us-ascii?Q?Hp1Ei/YazeyYhHWzmkDKgVk9Yp4iFmW/Tm+2xZuHGX+V+p8anFp8shaxosy0?=
 =?us-ascii?Q?NBR6wksmBaLvIwwxfvL9nXkPmxB4XOxEXz1hZt8H9WPjPVQPvYW8zDM59DMw?=
 =?us-ascii?Q?+KrJxjn4mAAOEKmdsHiP1Qp+3s5qGlgBE5anj4yCtuF8sMpcQ3eihh7BZPdr?=
 =?us-ascii?Q?6xDxf1g4Gvn8mnqAyygY8cBzrN4pEDUEOu3xaClnTsFqGLVBCRZsffQx08bf?=
 =?us-ascii?Q?uzv8VKtX2BE5EFPFZnpgNA20tLHnDJxOPsCJY0ep+wPNYFiHIMJMLJYP+r29?=
 =?us-ascii?Q?ADYghQ4BDt1Y6a4DgGHIGG1MXOHDf7WRqkozFzEqNk0nCdzePJq32Ou0kgQT?=
 =?us-ascii?Q?xr+oT6SVV+Opd26+oKOHtTJFc2MnHB06bm9usKRm9DOHvpiSnm13iIsbEQOJ?=
 =?us-ascii?Q?L1urcPyRRIDmyjsI+vAr/39AyZYbkhfBX6g11U/FhHdC8BTb8/Gs9y2jSljn?=
 =?us-ascii?Q?6SKnZ2duQV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kz0nMYJkoU5WdXHt+qyi6FTbnCGW9YLhD7v8aEFmni/rHwmhCZeu4J3dgF0r?=
 =?us-ascii?Q?ZO8IM9WCG6Az1Oz6v/mF8i0plq0N2REVcn27LKTBOtwr1re5ycVGYrhjxjRj?=
 =?us-ascii?Q?hu1+K+cjGkFx7JNyZN5oRb68Alv9T+ZzO0P6p5rLC+Jpg0SbO4gTkiYJrz1k?=
 =?us-ascii?Q?AnXoHxx6QB2sL39Vm/aBwX9XSB/7JiO7auNy9Uu/I+MoS64WGTTAqQXFCLZO?=
 =?us-ascii?Q?LgtyomM/fpjt0LOnP2P/2WfW9I+baLQOVNOJAaqXW2pUQWx7/IBU4Er59CGT?=
 =?us-ascii?Q?zQf0FH3pCOZj1SYoZG8CZf0nkdvW3uJmbRKnwnxuFX63bCy1BV/81VkgH38e?=
 =?us-ascii?Q?PIIXsFiI4RN/QklombyViQecJmEKVE+a1quHGoNaRDtzPPtUVzQNJE6zT8qH?=
 =?us-ascii?Q?Q+JOPg2UsmANncF1kg0QxjLikO90mArKEMkIXSSZ+FVhU5Sw/fXhxtDxGndl?=
 =?us-ascii?Q?ZI90vKOufXVrEAT6nttwj8h7laohi3Y2dbub6OSJqeOblsLVucWFJDqqA9i7?=
 =?us-ascii?Q?BlcN/symXni5IhwNgImZqh9H5ie8sHjSlSLfQi8/Tvu5HwdbkEB+jCx5iiv6?=
 =?us-ascii?Q?m1+QTaFwFRJQW17HL2oUSA4Dd8/0vnFNsYJ+yCchNYoUMT1dbdHSUiSDojbg?=
 =?us-ascii?Q?IDqKQX1bQ/iI56zszB6+B6sUUS06YQqd3VtKd981MTebybCjEoHi5YUa0s84?=
 =?us-ascii?Q?YpcZXZhNld/jTR/S5z3NxQ+LU3vLjOrOgkGFGijmXGz2//cV9GsAubBeEtJD?=
 =?us-ascii?Q?I5Uh5NB/A/D5HnBttiStht3jfLSq4r+O4d3QjxT/l8+K5gZUMkjC6dWncY6R?=
 =?us-ascii?Q?fVrql9fFO8Ewy5AmMuMmwQGSQSAFl9G15LSumvq7R+sCe4ZM+tWujfKRIxJw?=
 =?us-ascii?Q?HQC79h5SBYdKjNJ6kkkx3vkN84qyfa5iSGYqBYB+4Aicpej4IC+Ja5QuGhkl?=
 =?us-ascii?Q?paKOmFDwoEFTZflMFlDdvuhzu43y5xIxUcMyM+II6MT09O0ogLJ1NPJIcy8d?=
 =?us-ascii?Q?wYSWhtEsg6wSfVLeD6wyZ2NCqzrKSDZUKyOZjF/v++YIkdDZJbuJeGqIclw3?=
 =?us-ascii?Q?cq/1bC4nuHQWeLV/NbFvd1EUPDOaxfJq1ZyHvk0LjrQOH+/tzPciO48QhtRV?=
 =?us-ascii?Q?TjuZFkzoLVkSjbz7suyjMUiCQg0fbuBi4h6cVqOlqVtouQs6DM7RnoF3uuni?=
 =?us-ascii?Q?3K4kj0iGQiUjCrZ1wSWL/bFLNEfnXkN0ZewYhsMVmCmOVPy5vDq/7WOO2w/z?=
 =?us-ascii?Q?3/guAUBsB81FJ6jTi8b9GfxdkrTkswKHCO1p3S+NLVdcX2PNxYN6zuuXph8K?=
 =?us-ascii?Q?cUdB0FthvYzK8LfuryD7mk8xDTbCRG0uX8V/hnXqXI4BKhBNBLmP6CAdXA0X?=
 =?us-ascii?Q?vNEM/OdBb5HSuuKeFQ6/bzcnEGyW7c7fc1XQDKL6Kz2YNpPCA2PxkLZ19CXk?=
 =?us-ascii?Q?BOoNXvV8YKBvhHX9imfS0WL0bOo0/UullNElGOwMJX/F1/ItPYCq0sToz7/4?=
 =?us-ascii?Q?w7m0JV4Ok4wzXMdH1wTd9ucHXbzAL8A9U2S+VQKg/le2y0OONXPW5Ul+0UwO?=
 =?us-ascii?Q?ABawUvLb10WVLgESUi4OjF87DVvdUqJ5a8XjFf1KfDzvfFjzPXBwXBSj02Jj?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ByakwTcQb9JXBbj0QOy6iTaw+0fMIO4sgzHbTD/oryas6rQLYAAg1LrjNcGWTgNH4zFWLNVVKgWAuEEVhb2xh6mdZ0N0V9yCYuHjZKEghx6q3Ygh0sOjhHizZ7x5Gr9pigIx5Ld2CVR4DPO4AG+45vL2QfHvyDL84d1RCd5c0vO9MrT+lKPcdRtEOn8XuLpJQA88YEnOc2eDML699j7DLbkyyDrNhyE4BxA0s6OjDU2ezEsan2da3+lWVmwkfZURJz8U3THnZkfZikhuVeT7hbxXMuLDSaO/e29xr7RgosM/Oo9/xrEfOqpv6p1P2nK6zFkOUbjxvdaKvAfYds5Wggl6wdpVZpEqA/MXmnl3s5QFG8QK9Vbxzh13fgMWw17teGpQFXIBGgJvRq9DkPJw9x7+x9vPYt33ZgrUB44IqKxTR30EGn9nbZVAWFRHjGvaYQc9+pDEcGd+JTYe34gZ4nEIrYscXaAyi65I0BY8nCEiEy/6BzBr7EAflwZ1BMq7gydqVuowUzlbZBJXKOWQ+Du6ZNU0tMhJMAQaLxOoCDQDWUjSJqqGXFDqjf22YpLLBz+tgHOqWOBCKHqgqbfudgMQ3hTNaKdzffPVXLxuEIs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea637b68-2e6b-4ab9-77d6-08dd9246681b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:48:45.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3oPxa/TO19qcHYgOXkSvnVPLEInM814OMWDMtCUPBZFphfSs3YfNYX8/cOJe0m6HgzXVpyZAJDoHzMJhc5LHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130169
X-Proofpoint-GUID: DrQDlF8U88qOLqbt54hnRDcJRCXnm43F
X-Authority-Analysis: v=2.4 cv=PeH/hjhd c=1 sm=1 tr=0 ts=68238600 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=58Z5qo052Woecv8GQoIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OSBTYWx0ZWRfX+7paOGhxIodf
 BxnnXSlLDkQH4/nDZBEtz1w7qvoN96RbV7aSmsR5tM117fZP3P7LYjfKXaR74KFKjVMylcR926P
 MuGSY2RJQJ55HTaiyL7LpLNJfdjPf8PeciBvPYq+0FxMLo9XCM9GPrG3hqlRkTZBgHLOL/A1VyC
 MuTmgWgcTgRDrhZLzXQ6ThmsPG/dN6EkLyJPj0xturBin8O8ed0XEmJoNQA/CsTL88YbiOsKuJ9
 e+AfBOTezuPdx7Li906Xt0DkESLrxWVQ8hkxKzB4n790IHN8R9yIsUVKsKUi4RBa3ZFnQhKt2Sm
 xCRxfwTsXc9w+//S6NFnOnoVP3i0rxQd5PQP6ja0+n+84KCS4nrUL/Hm9hX8tJyDK/WhW+3wzm9
 N0FJGG76XfisUEy3jw0iQQkS6sRr0HzaKQdQtdZTm9xu8JpE3As5eturaG6k3gNaHbPVvXbS
X-Proofpoint-ORIG-GUID: DrQDlF8U88qOLqbt54hnRDcJRCXnm43F
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
> The "memramp() shrinking" scenario no longer applies, so let's remove
> that now-unnecessary handling.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

small comment, but this looks good.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
>  1 file changed, 6 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
> index 645613d59942a..9d03f0dbc4715 100644
> --- a/arch/x86/mm/pat/memtype_interval.c
> +++ b/arch/x86/mm/pat/memtype_interval.c
> @@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
>  
>  static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
>  
> -enum {
> -	MEMTYPE_EXACT_MATCH	= 0,
> -	MEMTYPE_END_MATCH	= 1
> -};
> -
> -static struct memtype *memtype_match(u64 start, u64 end, int match_type)
> +static struct memtype *memtype_match(u64 start, u64 end)
>  {
>  	struct memtype *entry_match;
>  
>  	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
>  
>  	while (entry_match != NULL && entry_match->start < end) {

I think this could use interval_tree_for_each_span() instead.

> -		if ((match_type == MEMTYPE_EXACT_MATCH) &&
> -		    (entry_match->start == start) && (entry_match->end == end))
> -			return entry_match;
> -
> -		if ((match_type == MEMTYPE_END_MATCH) &&
> -		    (entry_match->start < start) && (entry_match->end == end))
> +		if (entry_match->start == start && entry_match->end == end)
>  			return entry_match;
> -
>  		entry_match = interval_iter_next(entry_match, start, end-1);
>  	}
>  
> @@ -132,32 +121,11 @@ struct memtype *memtype_erase(u64 start, u64 end)
>  {
>  	struct memtype *entry_old;
>  
> -	/*
> -	 * Since the memtype_rbroot tree allows overlapping ranges,
> -	 * memtype_erase() checks with EXACT_MATCH first, i.e. free
> -	 * a whole node for the munmap case.  If no such entry is found,
> -	 * it then checks with END_MATCH, i.e. shrink the size of a node
> -	 * from the end for the mremap case.
> -	 */
> -	entry_old = memtype_match(start, end, MEMTYPE_EXACT_MATCH);
> -	if (!entry_old) {
> -		entry_old = memtype_match(start, end, MEMTYPE_END_MATCH);
> -		if (!entry_old)
> -			return ERR_PTR(-EINVAL);
> -	}
> -
> -	if (entry_old->start == start) {
> -		/* munmap: erase this node */
> -		interval_remove(entry_old, &memtype_rbroot);
> -	} else {
> -		/* mremap: update the end value of this node */
> -		interval_remove(entry_old, &memtype_rbroot);
> -		entry_old->end = start;
> -		interval_insert(entry_old, &memtype_rbroot);
> -
> -		return NULL;
> -	}
> +	entry_old = memtype_match(start, end);
> +	if (!entry_old)
> +		return ERR_PTR(-EINVAL);
>  
> +	interval_remove(entry_old, &memtype_rbroot);
>  	return entry_old;
>  }
>  
> -- 
> 2.49.0
> 
