Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB1A75A28
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 15:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C4C10E14E;
	Sun, 30 Mar 2025 13:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="LFQgB5N/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19011034.outbound.protection.outlook.com [52.103.43.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B6710E14E;
 Sun, 30 Mar 2025 13:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBHjU/A+grjk0V726XdLmcWKJiNIJb7WYRHUweIix6cv4GRBMrlkPfUZEtrewFZo8fZ5LWrWAFqQJb455gr7tzsW88RhtynVZNUjfPuMZQXXlaBlqbdjhAh1uhEGXRKgk5taVpjJY3kgAh1L3poLh5krRP4TRU2Str14X4gR/AkdhhZUQwOsuWBDoYKLJ8o5E8AfT2R+oQL6mk2WR56E0IcjnjGyjnS6nYH0KmRjnlWI1pustV3IK0Ws1189VGoyhOTwiCNd44ROH8p4MkAKhzAd+dihp8bmD5kAWFkXgysLL4eHeeFeaoX6SyujGiQ46BwoOjSy86hFxLT1U/VhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZIUHoQNjeKQ1Cv7P17Devmq8lw/2U5XEgjrIMgPxu8=;
 b=SJdqA7F57suYloGo8tETBIXlY/Tv+t/gh+LUzTrR56EnO+LgIcoRihKRQ/l88QpYexY7FbgX4N2nepn8mptHOUAwbtg/xM8LXMgCQbaDyyI+/dG/Ew1h37Vu6RVorq1zlf8BqdCedEi6BSEiDcWwK0hmPVfoApT0YnHY/08JVdPH4cdivn+5RJAIh7//PxyAKnzSYp79qfegQvUBWl+mP2lnlE+3D89XIhyuutTMYxX+sV0Rmeg4r/7FyvEqTL/QvfVzUVlH81RjMhDCgsCQu5/t7ePL5VJF2nCQzou2Humj6Kymrwegw+qtK0zfwWkv2wPwRcqkLJfIm0v7EInrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZIUHoQNjeKQ1Cv7P17Devmq8lw/2U5XEgjrIMgPxu8=;
 b=LFQgB5N//EK3fzXT3E+O1e23hK5lEZgu5ZaPbRc3BmZdaX6rLk2iZw45UpQgTpj4I49YHgEDA9tdip8A0iDLDVOLU71xB8bGcSlVRb7/xoa2cUBeAYAQsEsWu6Nv1OYkzGHXexnq1wSHvOwplDo94qIE+NC4HYrxz7F7UlZOxzALWIyYX5RWRbFnFgdpUJsmLeUWfPbRTKXMZAW1MQT3mYn2RxyYzaltIkLePe0T+hLIc4H6o0n7MKi1mmYGvQpyxULuqkP8FZi5hsO+jwyizUgF+k4Iw7swAqbNNiQa0S3POPvwwlG3ii1qEMzRQu/BFbBWVWmvw4ZSWkAvnFFzgg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OSYPR01MB5336.jpnprd01.prod.outlook.com (2603:1096:604:8b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.35; Sun, 30 Mar
 2025 12:59:53 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Sun, 30 Mar 2025
 12:59:53 +0000
Message-ID: <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Sun, 30 Mar 2025 20:59:44 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20250326234748.2982010-25-alex.hung@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------01R60P2a0LacOVwHKXPopxrL"
X-ClientProxiedBy: TYCP286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::17) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <8aed9e10-d455-4d8b-8ae3-a583a817e9bc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OSYPR01MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 705edd6e-9512-4bf7-750f-08dd6f8ac355
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|7092599003|12121999004|15080799006|6092099012|5072599009|461199028|8060799006|41001999003|26115399003|13095399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEI5bmExdktqNWY0a0ZielFjc3dMYUxULzRkYzBMaWNVR0hwczM3TGtta3h2?=
 =?utf-8?B?eExsaSs1NDJRZ3BZTzMzSklQT1FiVjdVVkJCOERlU25rc2gzWGFhK0tmMm1m?=
 =?utf-8?B?Y0UwNkxMZmZjK1doc0hGem9UNlJzYlUvdDJQaFV3cUpZS0VwTmlCaFFvVUh4?=
 =?utf-8?B?eE5GL0h4b1JoUjF5UGhGYUFEVDF0MFk1MEdIUkFxWXN4Z0JJRldva3FxcitQ?=
 =?utf-8?B?Y3RDMzlGZFRxZFhLM1YxVjRFOUJNZHdPbmowSVVSYWE4RHpWM2JxdDQ4YSsr?=
 =?utf-8?B?YTJ0M2VPREFRTk5wajM0eXVjR3k5d2JDTlNZVVNRWkY4V3BZeklPRG45SDFB?=
 =?utf-8?B?d2JaMGxzQjdERGw1NmJMYnZLb1RZaFc2dGxRa2ZSUThNbVRicWR1Z3BVQm5v?=
 =?utf-8?B?Z2pzYm5iUWxXcCtTSXA4S0NYZThGMXNGTUg5b1BOV0NNTkE4bDJQUU8vYU51?=
 =?utf-8?B?NTJIZkZORkNiOHlUcVFDcmFxVTNuemJmQ0ZYbVd3YkZhTDBkSUNUWjdPOVFL?=
 =?utf-8?B?bFZudU9nS0pFa0dqV2JmZkwwUWFSUXFKSFFUZ3R5YlVOVVpMUWFqUHh6bnhY?=
 =?utf-8?B?TGkzdWFUTGdDL3RKZ1VSM2ZNQ2xrL20xTXVQMjVsblZqNHZ2NERrblF3SXo3?=
 =?utf-8?B?cXVta3BuWTErd3lTeCthNFlPVVJPSGNJVkJXZ2d0dSs3QnR4SGdjZG96YTl3?=
 =?utf-8?B?YTBBSnBjZVdobHorZlZNbjZHOU9JaEZSdEdBd25VT29wbVlzZyt0WHBsOVpE?=
 =?utf-8?B?UGdFTFVDZFkwakcrSWo2RGVWRFluWVZwRVdsOEgybTh5QzhMVDJxTlZxUG4w?=
 =?utf-8?B?VDI4aml6b0lyQ3lKbFZUQW5IVjJ0UEtkdDZtRWU5OFAvZjNTeFNkTTR6VTFN?=
 =?utf-8?B?b3BzOHZ3a0Y5bHlFZ1BSZFA5SFo4bG1xTDJ6SmRxeW4vd0FQbUlLdmQwZEFP?=
 =?utf-8?B?cEJITXc1bzBLYm9hS0htNzcwbTRRRlFtTE41U01mYUNHSGk5N2RoZlNtdkor?=
 =?utf-8?B?T0tqTFBRV1RlRE44ZFR3eEZ4N3BLQkUxbk5lYlpkemFDTzRmYjBCWmVwckoy?=
 =?utf-8?B?WWlhRTVNV2ZYUjRzUUI1TVJGMjBWc1U5WW4wUXRkcTB4cmRsZzk1MlNUUEll?=
 =?utf-8?B?NkJ1Q1JWNGJ4dHFXYTd5TnRWRlEvOFV0bkIyUkdsRCt3VzdBMFJsMXNQOS9z?=
 =?utf-8?B?NjlOSThTb2tKanl2UGNKQ0RLbFltdEVReTEzVE5rMDNGdjN5RzU4L3VpYlVu?=
 =?utf-8?B?eVVVNDdEUisxSFFMMVd4YUZDbHprSVREakZMbjlpZktXTVZOWDBhOS9zV25i?=
 =?utf-8?B?Q0p4UTE0L1Z6YTV3T0xXMzl5OUIrTHU1R05keVNhVWZrbXRxQWxGMFZ2Z1Bn?=
 =?utf-8?B?MFUxaGtNSU5palBoT3llUDJpSjNqalBMWUdreU8rYkVBZjFRamhsNWFmbmVv?=
 =?utf-8?B?bGUrNjB2L2c0ZEJCOFk1aW8vV3lPS1IwcnZUMW4xMDdYNTVQMEZWUXlFeGFO?=
 =?utf-8?B?YjE3VDdLN1FHejhFZGUxSndCbEJYdHluTHVacVcyajI2ZGt5SDFDemZhd244?=
 =?utf-8?B?SEQ0ZVg0cGx6bWJrOWtXaVpud1NaWG1pZTFjQmtKc2RNOE5qTDVZRjNwUjN4?=
 =?utf-8?B?NlpBRVpSY0RHZm9RRE4zeFVTQ295UkxNdVp5ZlBMVzVuUHYzWStNN0F1UmdY?=
 =?utf-8?B?R2JUME9vbGVERU5QaVBBT0VBUnZudU9HcE1qWVIyM0FvMHdXQTljVDdYNUdz?=
 =?utf-8?Q?alwSGJwvXDGgaKPJxw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmMwTGhIQWxaQmVQN3ltekJERkx2TGtpTmVXZXlTd0FnUGZnZ1U3T0dJTDg1?=
 =?utf-8?B?VTZIcWUrN01wcExTdHVpb3B4dE0vdVhEWGh0MWgwTXRNaVNPa0tlSU8ybGVk?=
 =?utf-8?B?RUxFN1NUR2pGTmxIRUEvTVUzWEh3b0g5RVFHN1ZpRTBobzJXQjBYV2dUVU00?=
 =?utf-8?B?TkFnUnpFWlgwTVZabld0WS9oWEtob3FTZmNpcFVQTVhhbGFrdVhzeHdGREgy?=
 =?utf-8?B?bXNhVlo4VENMM1o2NnI0SGlQRGVwbnJFV1ZMK3p6bzhiVVpBSlJjZVBYMW8w?=
 =?utf-8?B?R1VTYlRXNndjd0ZJM2pGOWxMR29QeEFSeU5acWhETlpKaURzM1hRTkdZVXJF?=
 =?utf-8?B?Qk9Jdm9XMEo5WG1CeHlNaG5jeEUxRUtYbUswZGExVS9qWGtkVG9XNjhYK24v?=
 =?utf-8?B?SWNJcFNhVGVVZmJaNTlyazc5RmFKb0hVNWR2RWx2ajAzeDZkZ0tYYVhNZytF?=
 =?utf-8?B?VERvSWVSRFFyNVJLRTA2YWpxK2tRb1I0VFMwV2cvRnhkaUZxaU5vdjkydmln?=
 =?utf-8?B?UWJuaW5UQ2F3WVFoN0xBMm1hVmFsc2EzNkRGQ2Vqb1pNdHNJbjlXY1ptc1NG?=
 =?utf-8?B?U1g5QUloc3ZPSWZvc2FWK1AzRHNJbmlXMERJYUFQV2w3aW1oK1pNcXBZQW9X?=
 =?utf-8?B?SWhvQmVDckR2MS8zM3VURTBTYS80eWwyVHdVUm5jNkpoYldjRVdhcWcxL0pr?=
 =?utf-8?B?Z0greDFZRGl2VUZISUUxSGxOdWNsckR1L0NHTnpIT0cvMFVKdVJJVzVlUWNX?=
 =?utf-8?B?enhOOWgvSVJvbVZwcWd4MVFyTUYvOGROUjR6RXBuTkJPRERzTVovd3dLb2JX?=
 =?utf-8?B?Yi9xUWpEalVvMnZUNTlMb09kQjhsbTgyZ2tCR2U0b1NmS0o3T3piTGVUa0xs?=
 =?utf-8?B?dk4vd0s2QnUvdTB5dzcvWEg3Yld1WDVtMEFlSnBqc2paWGluaUxNNCtYeUl5?=
 =?utf-8?B?bysxa1pZWlZxSWJiVHk4clFFeGFtMFNsQlRRMjh6Nm9uMlBtbFo0Q3EveDlK?=
 =?utf-8?B?aTJsS2JDODhJODhQSlZOREEyWE5GVk9LTFYzVVJBQUo3TXkyMUpQaGNKSlFq?=
 =?utf-8?B?b3BDZkFqN2s4Y3E5ZzlnbGQ3bXdYMnJ1YTRMTW5zaVNoY3VSU2htMGJldi9J?=
 =?utf-8?B?WEFKcVBrbk04MHVNS0dHcjJZV2tDMGk5dmNNVGFJbEdhSjZUNUEwTVY4cEZi?=
 =?utf-8?B?Qkc2Q09na3lXWHNLTTJRcGFkRjNNVDJnNUJBdUxRRmgyYzNmSkRtTjRXZGRO?=
 =?utf-8?B?dEI1UzNGbUNYSXA5QWZhMXBvb094Wjc0RkY3ejRiMFh6UTRQQi9KNmphOGV1?=
 =?utf-8?B?NDJ3TmJyS0J5SmtZV05HTUFLbE1TTUxJMEVPSmNvdENiR1M4NERyWjZ0dm5Q?=
 =?utf-8?B?UnhDa0FpamZOcyt5bmxtU1ByZVladjkyVU5tQ2hCSFZUQzFYUlh0U2pwUTdB?=
 =?utf-8?B?MTNGVjU2TVpvdFJIRVJiRFhPOVROSm4zdXRMcUIyQWZpUGxjUU9tSVpyWEZJ?=
 =?utf-8?B?WHgybmFsRENDS1hZTFdDZ3k4WHdoWkNNV1hTM2RvTnh6NHpVVVhVaU1WMFRB?=
 =?utf-8?B?OTJTTjgvK1BmZVdMb3lxdmIvUmdzMUlQZENEd3JCZElTWGdicWFKMTlCWTdG?=
 =?utf-8?B?RUZ2bEpDQ1hJSzFGTGhnNEZuZXNxNE5hU3VXbnVURnFtcDlCcW93WFF0Sktu?=
 =?utf-8?B?dWdtNFFlZkRoLzN4UGswWENSSXk3QmdReHBrVFUyZDRYMVNWOXBWdkRkdEpq?=
 =?utf-8?Q?EvsLHPMhdY5Dx7aTNc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705edd6e-9512-4bf7-750f-08dd6f8ac355
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 12:59:53.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5336
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

--------------01R60P2a0LacOVwHKXPopxrL
Content-Type: multipart/mixed; boundary="------------ivAm9oblURxXGUGkfzmMhSFX";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Message-ID: <8aed9e10-d455-4d8b-8ae3-a583a817e9bc@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
In-Reply-To: <20250326234748.2982010-25-alex.hung@amd.com>

--------------ivAm9oblURxXGUGkfzmMhSFX
Content-Type: multipart/mixed; boundary="------------DB1sunWMx7M7Bf0Us0mRjkGc"

--------------DB1sunWMx7M7Bf0Us0mRjkGc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkRvIHdlIHJlYWxseSBuZWVkIHRvIGRpc2FibGUgY3Vyc29yIHBsYW5lIGNvbG9y
IHBpcGVsaW5lIHN1cHBvcnQ/IEkgDQpkb24ndCB0aGluayB3ZSBuZWVkIHRvIGRpc2FibGUg
dGhhdCBpZiBpdCBpcyBzdXBwb3J0ZWQsIHNpbmNlIHRoZXJlIA0KbWlnaHQgYmUgc29tZSB1
c2VyLWRlZmluZWQgY29sb3JlZCBjdXJzb3IgaWNvbi4NCg0KQmVzdCByZWdhcmRzLA0KU2hl
bmd5dQ0KDQpGb3Igc29tZSB1bmtub3duIHJlYXNvbiwgc2VlbXMgbXkgbWFpbCBpcyBub3Qg
c2hvd24gaW4gdGhlIG1haWwgbGlzdCANCmFyY2hpdmUsIHNvIEkgcmVzZW50IGl0Lg0KDQrl
nKggMjAyNS8zLzI3IDc6NDcsIEFsZXggSHVuZyDlhpnpgZM6DQo+IGN1cnNvciBwbGFuZSBk
b2VzIG5vdCBuZWVkIHRvIGhhdmUgY29sb3IgcGlwZWxpbmUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gdjc6DQo+ICAg
LSBBZGQgYSBjb21taXQgbWVzc2FnZXMNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYyB8IDMgKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5lLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wbGFuZS5jDQo+
IGluZGV4IDk2MzJiOGI3M2U3ZS4uYjViOWIwYjVkYTYzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wbGFuZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X3BsYW5lLmMNCj4gQEAgLTE3OTIsNiArMTc5Miw5IEBAIGRtX3BsYW5lX2luaXRfY29sb3Jv
cHMoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpDQo+ICAgCXN0cnVjdCBkcm1fcHJvcF9lbnVt
X2xpc3QgcGlwZWxpbmVzW01BWF9DT0xPUl9QSVBFTElORVNdOw0KPiAgIAlpbnQgbGVuID0g
MDsNCj4gICANCj4gKwlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09S
KQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiAgIAkvKiBDcmVhdGUgQ09MT1JfUElQRUxJTkUg
cHJvcGVydHkgYW5kIGF0dGFjaCAqLw0KPiAgIAlkcm1fcGxhbmVfY3JlYXRlX2NvbG9yX3Bp
cGVsaW5lX3Byb3BlcnR5KHBsYW5lLCBwaXBlbGluZXMsIGxlbik7DQo+ICAgDQoNCg==
--------------DB1sunWMx7M7Bf0Us0mRjkGc
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------DB1sunWMx7M7Bf0Us0mRjkGc--

--------------ivAm9oblURxXGUGkfzmMhSFX--

--------------01R60P2a0LacOVwHKXPopxrL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfpQEEFAwAAAAAACgkQX75KBAfJsRlG
Zg/9F4CCUbxpLUNZOD/7i+ScNNt78gz7P1L6SqVLfr2rbu7oUZcGh7e/N3Qgo4H81Vd8AODh7yyo
Q7/mLs6u8TnrujGcIWd61YbQRMCxf+0wMWrHb85D5Ju1rV1ozcA0dLXtU4YGll6t8mjGEY1OaaBR
AlYZmnoCXMG8JD694avlmYGyGAgVSR35lRnIEkTIZeUfRfQYtajcvJibXeAXktdDlplwLsNe2RLr
6DMsveQ4bzCKypHqQenIo86T7wBhzQ8ZjTelSXovM/Moy6HXPBsuhKCax5bt56qyBAyLb3DJjFtj
cYl/ofLFawrtfghS5oObONwa+whHkMU9XmpY756JDvYjFA1VUCfgaEMGMMxSTLhoXcwc90mMSM1i
48gcjLEw90tNWU4ttc1pMomhGuT+Pp4digr2hRHeVSyUyy++9Pwom5nurdXaSCOKKUdRNzjsqNXF
OjcNBxaMUYYaTkECsiwLUmO/sTIdpjfRmEdvNpShzshNJbT8omLXrTRx5kS+FvBLp0lePKzq+SRz
W6B3VIcOL9ELoD4N/oK4B+TIqniXiSEVj6wK/0upofZyQQfaE2a2gPneiXyg4qwNv3X5tBFXz+Uj
30XnlRPpq5KBirsTi1D67EnJ7NYKp3GmiyFv3SSvXhCbcMfxNnvmDdbmemW7P9BAsBD1me/Spg8O
8NU=
=8xBR
-----END PGP SIGNATURE-----

--------------01R60P2a0LacOVwHKXPopxrL--
