Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD20AAE30C
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1A610E80E;
	Wed,  7 May 2025 14:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="WsjhIu6a";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vjeScAUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9510E826;
 Wed,  7 May 2025 14:33:52 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547EExIj019186;
 Wed, 7 May 2025 14:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=JxAHbjOEoFVsXKngJN
 uWdQkk4J2DsgIM1CULu0GrQp8=; b=WsjhIu6avmeUHpEGA4nBZU4oeZtMXedWD9
 bXRgtBaQ9f5TpIaMxrZxvsUN1S8FSSI6o34G11M9Fe3OnQnY4dC8utl7rBdY8qPl
 5iUqiB7mfeAiCGdlSyV6hpkcoSr+vpKYcpoG8qZTDJHyohc8al1Pc/U5NGwRwE26
 /xH2Qy0wq7Q80QPflHd2fOXrocxmbaIIneWO/WTp1DyXdrgg0nJ6RCqs8TRMatjv
 8OlYVV1fdYpwti9k0hDNkCv4vRPFUbajL1lRMCNzF9VieYgFvRY29fWdnUWG4bJU
 /C9o+7j6iowEfJiTzEKAxHmtxj2kMpfK+mEM2BI7DnS5QFCO6r/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46g9448294-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 May 2025 14:33:14 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 547DEdcH036019; Wed, 7 May 2025 14:27:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46d9kag919-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 May 2025 14:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc9O2fxE2I6U0UtBvl8kx7CQQJPmtR2sNdBggYu6SbyPc89ENDehz5eEAQ0L9ZNBHKrSA/7m7EvGfoB8L8zAe0fX70n4FNIE1An4oK8jxLDy6KokAUhLC0iDNZg1WZ50RsI/yYVPFD8XNC/Nl7dqfQZWiyJ6yUlcu1dRxCBhXaAHetvZhi6CiXQkoC+tL/pgJz7dND0b4Hw9zrgLqjXgI1ZPp4wyutU3oKorRqpEVKkeKBYzFJ4AMHFPTiqV41M16WeevbJt1OyQgVKWlnInw6qBJqF9pS2kxnOtykf4viHsuLePRZKATA5zy6BqNsNMzX2z1y+0kKGYYf0+3tVWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxAHbjOEoFVsXKngJNuWdQkk4J2DsgIM1CULu0GrQp8=;
 b=ODJIH/xiBOh4iTm5+1TR4iYPjCWQCZymnfNc6rsWuecnfF7cibF3MFXgAEIiVH4IG/yWPdgKzC20V6mlbecPQAqZLsbYHzPCELvsmkJ4L5NMwl3WMkji6EVI4c1mB/t1335zfaG5nfo4Vse4QEhaZOFBoCvgO7mrc4GRdN1o3S8EYh1vnVMeYbGsYlsU4S5GkO6JUFXp3jb0uRo86s3EQX8UgX204PspgXaRSFF/QfiqNK51fQ2kHQ8Kd7FSeb9XRjBV+Dh4XTrjVNtpaaEhBovEod1kTUITyIhrunqvVp8KDZllbj6R95qwQm55d0DZj9rXRNcZN3L9y/FpsT3bpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxAHbjOEoFVsXKngJNuWdQkk4J2DsgIM1CULu0GrQp8=;
 b=vjeScAUIjwTtTCZjHA1UDpSqFAR1ZHoZrNJqmtlfA3Fh5qaH9XfsNk5mYsZv6p99alTbyZvGXJfSaBdQETd3A6MMlS9Ha+EEfrWPBMfxhfsOnRWgECy11x9+LHN/4Brttgr/wseNw7ltbc9LOVEd4vJQQmN0FE84wMYQHzLV8Vc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 14:27:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 14:27:38 +0000
Date: Wed, 7 May 2025 15:27:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <5c8809f0-c6f9-4151-b075-937f29c5db22@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <b92e3a0d-b878-43cf-9b68-9f7c228e45fa@lucifer.local>
 <7035fb14-c9f6-4281-9f65-b220aaa8f5c3@redhat.com>
 <6fa60c1d-ccbe-4bf4-a572-39711ac379ee@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa60c1d-ccbe-4bf4-a572-39711ac379ee@redhat.com>
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: a2465abf-f476-4a83-e38f-08dd8d73519c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBrP2r1fyxjQyjTyhR/PpUgGp55LWPle1ZiOcUscJeIdv61JuYE3o5AWNBMz?=
 =?us-ascii?Q?uKKgssNf2wDxcI74hUSldOk+vDcveRsH75PQbDWRKZr1j3A+HvlmJ0P1ki92?=
 =?us-ascii?Q?w6MnWCav6IezNWx2tlETKhKPKE38l/qa2C6gpq/W7vn6n/37/jGPFF5UrSWF?=
 =?us-ascii?Q?w28BxaFA0vDvniMQdTqnJ0Bhcd+W8Zx4twixSEAGCF+gwF00lM5DRWukG9iN?=
 =?us-ascii?Q?S5BVsAyoNNycPv0lv5GFnoodxt6Gu7o/NAQWs6VtTNpz+LtFe4CRZKv0m6ey?=
 =?us-ascii?Q?O+9jjOoU6AGd3JWD5R/OeBT/BeXsKmfb+LQYgFH4KW8aX6CENwEfftwehuLP?=
 =?us-ascii?Q?qfM8WxoKbmGlKVAe3SJu9a2UbSf8rAL3p7u7puG29GpiCFkhufTGffyySO5C?=
 =?us-ascii?Q?1WSoaW9YZwzH3I9Dn+vG2WY+OwuMUIFc7+2WK0g65NobksQxzmfI4A0VgwT1?=
 =?us-ascii?Q?ONPu34n2Nauj/IdgPE7Rl/ItTgAMACUq2kfmy0l9yCbupvIdfIOajrOlW7Wj?=
 =?us-ascii?Q?J22NXtN31bUjT6PGeFuiYF0lNkLz1iP2YZKgOlJVnJrdhwJBKXXr6DOWBH+r?=
 =?us-ascii?Q?QpP7l0Kol/mtwYJyYbNal8MTBgbRbSaGgvZeogqDEkEpm8GuUjaJQP/BmR7d?=
 =?us-ascii?Q?SavEMASbJwotoalTvC3MPbR8vdnM++paxrMEO4Kew6MzC6DtdgRzHm7ry0IV?=
 =?us-ascii?Q?stGGLsRdadsdH/Bh5BoNGtlJjxdr61SBSttyeA3LQKvCmiddJuUf2cntm4F/?=
 =?us-ascii?Q?WfilYEQu4nefYs1ln1YdJJ5LkhyP/KbnIfvlrwYWbqK9kC5vXC654toimLy5?=
 =?us-ascii?Q?0gVDYyvRFrFDfdcL0SfdBORhf7nAYNXeJw/9Cp3CPHwKdsyNxPR10A9uWYv4?=
 =?us-ascii?Q?+LhZjS4d5Hu3naZFM/MVyPsIBqgnbORQOjxA0zorUj+vgjAKWc3c1HBg7W9a?=
 =?us-ascii?Q?70Olk7RGH2OgaAXfIrlP/xtzIwfh329SPUJVJUiYQGuv3fhP1V4AlAvDiVa9?=
 =?us-ascii?Q?hfk8GnooNcRHKDNQ+VZ+CXwZRsSqG5WZgJEOVs2zQ4Plv9CYXlMtkSszTsvz?=
 =?us-ascii?Q?7L8KshLzIaOTnEnzUWv1X96Qhn9b1UorQYnxyvbUsDp53dTw4B5/sl820xbO?=
 =?us-ascii?Q?ZANfVRErIfw51qPv/bxcc0jC1Uu3wTGFsMPcpJAexSCSY3qWl3MR5ckzlYI+?=
 =?us-ascii?Q?i4zyTja6aiQy0RODNsihzanVbgctavM2/Dsj+3voFm0tjHq26Jx1JMo6IVsx?=
 =?us-ascii?Q?EWapHwNX1MVQSNcRZOgbHz33fmuakxZyhPYNUZMNPrv42OO7gWHGUvb2mCQ7?=
 =?us-ascii?Q?Hoj58l5OQqyOJwRXXRhDaBNG8mQ6UqUXJPiHTaaYa56gfi+3wje9N6etFGwD?=
 =?us-ascii?Q?itXKyLh1JhM4UiPbhFEE5Pm6+rxArjV+D2bR5HJzeuqS9f6ntePwlG4nvyuV?=
 =?us-ascii?Q?QHbThKsHb7w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqA2KWbsPKJn9thWsLvz7CJ7BirRx8ZZPaTX3KFAN4EflWH77qtYvI3TmbEp?=
 =?us-ascii?Q?m3DnHlWYd3Ig56HcJDgMzv4dBQYLxHLDI3PWHKt2JkrUYgI9g+v/MYOTfj6E?=
 =?us-ascii?Q?po7EJaSKs1umO5ebkA46untfkEiX2g6w+mOy5Ilj+RM/UWjZa+9N4Qu4F6s9?=
 =?us-ascii?Q?R49ksvlTFyh1/aI4j7Hk+LgvT9ALbVI9XrtgwxR6ebmdfd+kk9WfW9HD5Pnz?=
 =?us-ascii?Q?XGhYpRP5nGuaTyIOmw5lRYYv4z3QHojRpJelXFDJVOUco0rvWCRinIjbkYba?=
 =?us-ascii?Q?0F7SAjPqspgD/5Cr4eh/WyynU+wBaBpqwWMeon8VAfYa51koMn7aBJcm/DQO?=
 =?us-ascii?Q?HbTl5MkvnkdVsYPwAJkG+8LlOanOup/osNN55wv/kVpKzCWRve/J/H7PCh8J?=
 =?us-ascii?Q?dC1+taWxilow7chshH4EJYDjUkC0z6RCIR9j1Dtw8FwxULzE5OoPJVmzvHKQ?=
 =?us-ascii?Q?6EihFZRY7kSCOKiUJcrbodWSR7iZyKhhauhnjRfajjbfSr4WNrGVr/l4tcY9?=
 =?us-ascii?Q?7NA5j0DYc0+/R4nKjrOJQz84k5CIgbxMb4ajGYditD3RwlS53bD1WGYKSFei?=
 =?us-ascii?Q?vWOs3q2mNhOJ0KibFuVAqKiu+kbeZ5wRFhuoR21MR7oUxQ+1McUaC0f/dui6?=
 =?us-ascii?Q?4LXIphOUIqd8zT7FpdI80Aiq0DoAF4OS2JmOcNbp7h0bjSkszDkyuuAR+Blm?=
 =?us-ascii?Q?MxqrPzp2Ezz6wxQERQhYeVeTY8bYUS7/Xbxj1TjSpkGFsf5a8i4oRS9FHSCK?=
 =?us-ascii?Q?Idc7sivqpogHJZ8Sx+YnYl3qePgK6qkf3+/eyVP+qAB5RiWhBoRS+nsn5BCJ?=
 =?us-ascii?Q?p4+SCwy3m2BZykfOVBoYIeblZnkCYYDBggBELd5RDxs1FMPKujZ5HtPQSX+G?=
 =?us-ascii?Q?Klk6EtErE2C9FpjL2WaR2M8YGH4fzXfTiCvld+4xgxp4ut8QvzaQzc7hovBa?=
 =?us-ascii?Q?5d87Uv3kPFbdx4T92KQuo3uCSPcbLDDU/p+G0VkQuc+yK6uXjXLUaHGLX8wU?=
 =?us-ascii?Q?DooM/c/hNkdZxf+34dHgGeq7uy1QWL+8tYi8UU++Psm2UMv02L0pDhTvYJHy?=
 =?us-ascii?Q?8mmmWFWaq0yEkJHAJwtM7OHAoJ3FpssyQx50Np8YxIGszeajeyxGk7A8a1TY?=
 =?us-ascii?Q?+Aulz5dVaxoTIgL1JgZXIudZcvQhn4dolMl41OUjK3BLb60wu9OHuNiyS7K7?=
 =?us-ascii?Q?HVtIWtpu1qlD/4E/eQiZlYEtu7aJZzEHdwzPnLXpa0/PFE+Ah/ETEcaa9UDo?=
 =?us-ascii?Q?0Lwh9VFN00c3XCeVPMkLZinY5sJpNWS+sbYICGm1K0TXzu+wv7Npe66y0RxQ?=
 =?us-ascii?Q?QSf4l60/N14+u//U9t980fIdaFRG7KDtA/CQy/ner7Im+T4iXxrcvMhTJIWQ?=
 =?us-ascii?Q?1oFEP7jy9JRug0WlvX44byejfLJnLp1FNzIDrF1JmQQtKteE9MydV+fLMfaQ?=
 =?us-ascii?Q?d8x6QfuKh2+i6OdfmQmNYgcsOqYMK4NCxXRb4z+WqhIWASYIZWxf8uemnbKJ?=
 =?us-ascii?Q?vTuFiJTO//Iv7y0JSnOKrPKnA7IVqtMBT1fm+QR+7E2jpKuhnEuw4ZuzmFlR?=
 =?us-ascii?Q?gtsfP/TdbrlpbP5oHTwrnyK/egwqeJefzhrG1CZYNgzQCb8NGnxooa2nGhiX?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Tz4C5zrs5t/6o/JIyy6h9rmjQlncqQu1wsyQHt968SRLuokzNUFvpK8HudvpweIiJA+diNE/b0f6uSn+Qvn5qnQGyFo+JTmPm97basIPpnsxS8nnK7jloX05Ln38s41lipW/6mbTyeET0otBjMr12pClDdXlfAXIpXQS9PIGQmbRAhdMZR7R91/PWPcHVLnCTy78EsrymcOTThEQrjdEzlspxrrW16TcdbE0cK4qoH4lCN2thh8G0Z7pprSTbx+L404ywh4phPbxyTlbe0gsaN+tnNKd7VKf0AScuVsWZO9TwkUP/PVmSQV9X9SvUDnXxj2GW6uuHoeRGrFMhjul9mO7U6LPomXENDJSoqvd19pVVzjxacogl8tIj02WCapOuzkvinWaGfVtHCL2SL9hO8rbJO33/4cQ5lGx54eV9FbrNuOlsafquohNzAymmnTHWyKw+NZSqFWxpZrKzURgdL2IqNZnlmiX+/nIpAAWOtX6CBAUALsViZ2POlEwhoJrEUm9TiOfhn5XgeCtSAP5YTRhY2VZnHhqaYonfvurLjhE9hsCSb6G57rap2e8aanWiYIVjbkiun6sTx4zPk4XKLMYPeftjEGNDQlk6Ry3zg4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2465abf-f476-4a83-e38f-08dd8d73519c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:27:38.7439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGZEmIXujVprgBoQbK7Nvm791/7o4plWIWHL5lRiaYB55RFMxx6S+FHBV5Kl5JriYnJSTYIsK6+K7GQoZwBmJBTTZI3ernyfM+zxlhUfUiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505070135
X-Proofpoint-GUID: jihUFgeo0rhGvInNPcI84Zdc7NuRRJVy
X-Proofpoint-ORIG-GUID: jihUFgeo0rhGvInNPcI84Zdc7NuRRJVy
X-Authority-Analysis: v=2.4 cv=esDfzppX c=1 sm=1 tr=0 ts=681b6f2a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=h_XL6v5M2B3L0u4WpLsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEzNyBTYWx0ZWRfXzh+12hkeHiEB
 WhBZc3lg8E1Rx59aC41w5WP81g8bi7ddNIdAYPfUFG0m6Q9DlgdSU9fnQ8lge3KYARZ6F/vuIMr
 mOT2tSnxxMDFK5I/aEuoK7d5Zztsh/i/Its0hMF4jmTl4zS/RJoL5mkYmDPVGqVsWdAar1U7Dee
 zyBYqQXAKhW8JRWtyMb3dIDu/I5XRH0FuelYSM/Q8X1uBL8roQJTIybC7dCbYVGlV8xJHjjIenq
 wnHgvJARirS0RaWJOxr09OVnab5RM5FUy85T0Bpt5QAuTzcPrz40Fo8nAzfibpd98ReLk0IDkqr
 YZdzOAmzJGTKWYWMNZdWqPuyAZUjg9bac1VXJYdLMHD2qmcC3q7LFCMkK3hDHnDK9lN8p9vs8xv
 nruPjn3+M4+unD9xKYOLplyBoK18Xj4VQMxdOxcFWtxHgeAaQAsKiJcSJ24arMWuiEt5q+ZT
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

On Wed, May 07, 2025 at 03:25:42PM +0200, David Hildenbrand wrote:
> > >
> > > Obviously my series will break this but should be _fairly_ trivial to
> > > update.
> > >
> > > You will however have to make sure to update tools/testing/vma/* to handle
> > > the new functions in userland testing (they need to be stubbed otu).
>
> Hmm, seems to compile. I guess, because we won't have
> "__HAVE_PFNMAP_TRACKING" defined in the test environment, so
> the existing stubs in there already seem to do the trick.
>
>
> +#else
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +              struct vm_area_struct *new)
> +{
> +      return 0;
>  }
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +}
> +#endif
>

OK cool! Then we're good :>)

>
> --
> Cheers,
>
> David / dhildenb
>
