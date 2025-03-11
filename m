Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF4A5B997
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6AE10E516;
	Tue, 11 Mar 2025 07:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="i1zXt3Fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010062.outbound.protection.outlook.com [52.101.128.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307F10E129
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYj34x1ZXQfhzHb9QhsJcwG2Jn2EPO86AouB2badMd0EngrpQwoq1eUx4mwbJ7B3umtGzO7ZoYIPOub3ZalLH1XRXi9JqEx1ckI4yY0uBFcAW0an+jLmjDD1LETpKQovD3yrTHdpzPpGihY7T9OgMnDSL9etJQGDV31OfYS3f3x7GIGfey0OELuhDzRc7NdFO5bJti4r3/fiSe4+UWhWN2jr14eKSWcziuja/Y1E3ETp+pa9keYvED/OtlwHRUgXqSzTHQNhdWyZDaZot7Lsbfn2OPoEZtSX6IyKgi1fAt93hL7oH7BlvgufoX+r2BoivBNJhkZl04cjLjzv5WBNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh3FY3fgFDIyT4L8STHZNUOESccMItlFvFXmkz95+ac=;
 b=wVHqXI44jtFWW6C2Ljv+fd6Y7EbKdcrNVQtn96WYnUtN0xE8uMfySxd6f39hP3FYcU3oaA0FDTVZp5GCMlug6gbZfVsTIFemKh9TIK8gWGDIbQUr3/Xd8mddjoB1HUU/fZD8fUer890RSe6Wo+gbpHMdDrioP9TdTl+FcTxVOd+ZSuKPI9XMRhsvh7+1+03OpE6ylqlrfwI6TJfJiOMYsEm7d93YDIUZ6bqxgJFM+s/dQkFnXhKEoe2TNxv8epElhxGIoqoBeTgxdf3r7G+v9OsWRs7WKpX6UgxDlPq2qkxtgL3cNyga85rR8bk/mpxqwlxtyqzTGMwRdfttm3EVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh3FY3fgFDIyT4L8STHZNUOESccMItlFvFXmkz95+ac=;
 b=i1zXt3Fl7XPAjI2wckbZiOTko+3m8BbMc1MENH3CkrA7yCmgYSWVN1zKYV8uccyj/nMpWaMKxSmLjeaZGgLtFXfJcb1WMaOL5dGwWQQKA7GaEHr0+DRvdYcvpMLT2WXHpQDf5o3VNJvBybrZQAZCIwBmH/8xLOO+fJTIrs61R+t9bDSt5HortimxT3HxotQmzkDNq2NisPzIO5yAuVzes5dCFvV5ccciI+KWgHKD9O/7G0JIE17Kpq2G2cq1pupJlWsYpgS03Ns7sBwPO3C8HvRMAfvpSSbpmvxaaOv6ZHp3gHxj/y2xZ6Kk7Y75+CeexZyi5F3HTfyYh/CPmed+sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5578.apcprd06.prod.outlook.com (2603:1096:400:328::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 07:12:44 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 07:12:43 +0000
Message-ID: <d7a54599-350e-4e58-81b6-119ffa2ab03e@vivo.com>
Date: Tue, 11 Mar 2025 15:12:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
To: Bingbu Cao <bingbu.cao@linux.intel.com>, vivek.kasireddy@intel.com
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3a6453-f1ce-4db2-c89b-08dd606c1dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7053199007|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFYwMVZsSUtWVzJUVU9YYmlZWmdjVnQ1T1hiUUVibjlEQ1Bkck5TTm9PMTBO?=
 =?utf-8?B?MzltTWdEY1JISUwzNzJROUlPZHNMamJMUEFVaENXUUY3dEdxNWluQ3hmN1FN?=
 =?utf-8?B?SUoyVDdQeDllVkZ0ejJCOEF4OElYYUx2RitQZFNacVRsNVF5MGl3enBWVUZ6?=
 =?utf-8?B?ZDNxUExDU0VyRWI2NXBZSGQza0RNZTRlUWh0ejN4RmFqTFp4bWVSeTl6SFAr?=
 =?utf-8?B?MlN0MytOSDNQaW14VDRxQTRoeWpVdmI1bzF6amNQaXdTT0VqaGFsMjZreDFH?=
 =?utf-8?B?d3lVUVF5TkhOWFF6dUhTejh3enE1eW1nd2cveGw0OVVtenIwUXJxdXZUZGlv?=
 =?utf-8?B?QXIwbEQycEU0bE8zQ3ROZHBIeW40REY4bXM5WEtLY05VN1UydzdOUGIyWTR5?=
 =?utf-8?B?dGt0Zm1lRzVabG1VMnk3SXNIS1pDb1ZTaldxc1RrNk5RSGYvZGZaS000V2FU?=
 =?utf-8?B?VjRKN2I5aHdtTzlEZVV5L1NYNEkvY3pWS3pHallWcVljbUlHTVFjRDAxVzcv?=
 =?utf-8?B?SEc5SnRJRERhSno1QzFKemNxVHkxd2FrY3M0M3crcHg3R0FBOUw0OFlzdUN3?=
 =?utf-8?B?ZmwvdlFVbVpFV05wNkExVXFHMFJUUXJmN0RhL0dCZ2RCTTlSYXcvVjZWQjBQ?=
 =?utf-8?B?RXArSnIzL3NOT3VMZTJjWmFkYXlHS3JLd1d1YVBXY2xQYzJhUi92TmFaWE94?=
 =?utf-8?B?bGRkQTdEUXVDdDZWdzQzS1Y4a2lLL0IxZmwzMTg5dzZ5azdQZnlaRXRsQlJB?=
 =?utf-8?B?UDFuQ3RBNkxrVnRNOUg4bHZkQllra2RRaURZc2t5MWw1UkxueXFvUFZFN3do?=
 =?utf-8?B?T1pwWmU0Q0RLUGRlemtIY2tOVC96VmVJRE1OZWlpU2IrTDQ5cmJ3SitRYTBt?=
 =?utf-8?B?c1cycXcwTTR2UjhLdnBIb2JuK1ozQTBYUW1uQXdKY25qZUs0U2dCc2lLRXVV?=
 =?utf-8?B?RlUra0F5Z1p3dTI5bHAvWnJZTjRpVWdvbndOb3ErSTJoeHRUbm90UFpQb1FB?=
 =?utf-8?B?a3BjTlYxOVNpWVI4UEJnWW5RT1J6WXJ4TnhLdENjS1ViMGNjZjBSMzhVaERq?=
 =?utf-8?B?c3RlRmZVT3BBUldEZnNMVnUyQkw1enI0Q3hiMzY1Q0diNldtdjdiV29xNk5D?=
 =?utf-8?B?azdXMDJhNEN0ZEhqWDBJa2lMNW1OeHVFcUpNOWhGVnVyOFpZc2kzNHBKNFR1?=
 =?utf-8?B?U2Z4UjlRRkh3OUs1Wm5nSEtJRllaNlVUazhqN2N4OWtEQ2U5RHRlMnV3Qk9V?=
 =?utf-8?B?SndCVUtEYnN1SUQ1Yk1HSGJ5L09VQUlaQXpyNm5SQkRnSTQ5SlNFSjY0TFdN?=
 =?utf-8?B?cWdLMTZBY2IwWFpJM1J3a3krQWs4MXU4aUpqOUF0UlMvbDBLNWJqVE50cmNE?=
 =?utf-8?B?ekY1Y0RIZFVDR282MGJDUmE4ZXJhOEVSa2lncGhsNzQzL201UGpBL1NHQkov?=
 =?utf-8?B?QmlKZnVQY1c4bzJiUTdEek5vamxhZGx1WE5lNmd4MDZWNGJjNFhDZnIrOTNs?=
 =?utf-8?B?Ylk0Z1hzcnNGbTFiZDhudjY5ejQvd2tQTDF6V0gzZDB0SHZpMVlhSjJWejFE?=
 =?utf-8?B?d09ZUG9XWVV2YkxMYit5cHZzM0NlVkJxTUpQSk0yeXVIOUtQdEpZcjdJM09T?=
 =?utf-8?B?VUdZUTNYQmJyMTViM05UcGQxWEhVUlQ5ZTluczk3RFJJZmFGWERZc1E1TGx1?=
 =?utf-8?B?aUNHU0FyWXp6SVUvM0l5alp0YXJ1dm5aWEpMN1BzY096R3d3emFIRGJkK2pT?=
 =?utf-8?B?dGZHWjRZRllZK0dMSVpuVVU0L3ltR3Y5L3M5NW1uRnU0ZWRRaUZyWkExZEF4?=
 =?utf-8?B?bHRhcU4vRGl0VUl2SWpjNWFrUnVySDM4TlJBaHp5bklBQmRiaVp5M3BqWGFS?=
 =?utf-8?B?WHI1MXgvR0p4Y2VJRkhmNkZ3WGtsTmFIUWY0Y0tyZDRyaCtBNFEwY1d2RElZ?=
 =?utf-8?Q?QP15YSNBDT5vOomGmCxE8up8VjBwtn6Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxrZGF5clpZM1czWWtHU2JBRHUrWVFyUkJ2S2FuSUd6T0lyalh1YmRkeFhV?=
 =?utf-8?B?akZKQjRjdTgvMEZVeXJUa2h3dGsyK3QzRHhOblZibUFKWld5S09iWWdIeHlP?=
 =?utf-8?B?U3BJZmY1SGtCc21ISlF6a0Ntam5WSElPaHN3bWdxaW1QRjZSSjdPTnRlaHZ6?=
 =?utf-8?B?azQ0U1hVMktmZWltc0kxaE8rS1lBUDVZOVJ5UzdpdUVmclNvRkVaN2dDTVEz?=
 =?utf-8?B?WmRGVVFYZUdRV2loNi9GcUR4M01hWHBIajR1SWdVN2dNZ05uRHJaQklVbU5Z?=
 =?utf-8?B?cldQTVl5MEJxVTRTUlFwejdzL1l3RjljN3h3T3h4ZVZWbWwydGZTWndLWHVR?=
 =?utf-8?B?V0R6N2lZZEx6WklxMGdsRjBpV1R1bE5UTitVUVdiS0JiWnFTWUs0L0M3c1h0?=
 =?utf-8?B?VjJSKzFuZWhzZDBYUmRZNk5zS0VXWnZFaEJ6aUpOMnI5dVNNajJiTzNnNXp3?=
 =?utf-8?B?TUVCVWg4d2E2R2FObXoyZFViMVJpSngvMWFpQTgyRzhMNG1xNGV1Vm91SzR5?=
 =?utf-8?B?K3p5NEl3ZVBHdElONEEzNlIyQ3p3bWpwM1ZVZkprWmtIQlh5Y1FSZjNOdjBD?=
 =?utf-8?B?NUtMNys3bC9YdEQzdFM0R0tmdHdpM0lxTFN4TFBubnJKSTBBWXZjZDVIdCtB?=
 =?utf-8?B?azM0eWh6bm5hYmxJQ1Y5Q2FGM1NnNHN5YTNCVnNsNktUMGVyNjFJdzJId1Yx?=
 =?utf-8?B?Wis4TnFBclZGclpwNmU0MUdTZlhqSk5LYVYyNUNiQkF4VnF3L29vMkFhcE5v?=
 =?utf-8?B?RFpDNlpUNUx5V1JWeU9SRVBMN3ZiVjlkcWFmVVhXd2JsZ1RCUWp3RDNMVHZM?=
 =?utf-8?B?RWN1Ylc5RWhYQzRkdjBWRFNnYjRZQnAzTTE2Tnp3cW1TUjZwQytCQnRhaEVa?=
 =?utf-8?B?V3JRU2RvVTMvdkVsb00xVUxLRWFTWHlzaitielJRYnFzVGJKbFJWTjNaQ2dT?=
 =?utf-8?B?bGRjOXd5bG44cXJEQXdlOC9GdDRyMnVsTlpDclVGOGhERTNZR3crYk5JemRi?=
 =?utf-8?B?N1dnSExTOUFjZTlkeUtnTWtrQlh6Y1YrYzJqeU1neExuWjB2QUgyQ3lpeDEv?=
 =?utf-8?B?RmpibytGVVUwVGw0d3ZydjRTeTREL2JCU1BOSFNhbTRDN2pOMXczUDcwcFFI?=
 =?utf-8?B?Y3BZbUVKWFk4Tk5iSUJ6OWZHSEhFaE5kZG04U05EL3ZRU3VISHJ1dlpsZ3hv?=
 =?utf-8?B?WUhGWDVhaXNjZW8vTmJ6ZkxpUXFFT1pqQW5YV1hGK01RUWZ4RWN6dkJ4ZTNt?=
 =?utf-8?B?SDJLK09HcGRNbHh5RUgwLzdMT2J2ci9JeElkK1NkMGkxMWxDOWJlWXMyRERW?=
 =?utf-8?B?OUVBaFl2UGJmdFFtWFp4RFN6RzdPZmZ6RjdWZElhNEtWa25KSExUL3hrbFM2?=
 =?utf-8?B?akhIYnFraUZGMDd0L0M2RDREYnQwN0Y4VnMvcVRRUEt1eFJHR1YrcDQycEo1?=
 =?utf-8?B?Qktkdmgyd3dRdjJVbjRVeVZsZG9mV1kxdTcvRWRTVUY3bW1vTld2TzVLdURJ?=
 =?utf-8?B?d1NyaGcrdVc1TVQ5R3ZKMm1TNWFRWGQvYnhRMjh2VEhHeUFZK011YjJKV0d2?=
 =?utf-8?B?dzVDQXFrazZBYWlaWFNRYU5MelB2aXlHUVRoalpXRTVDNVU3dncxYTl3b1Vh?=
 =?utf-8?B?dXVQclBmUTY3Vm5HWHYrcU5WTFBOazJRVmFzUkJQMzExMjlBeDAwSG5MTm8z?=
 =?utf-8?B?UHJwditYL1ZQWU5BZEo0SGJCZjFqWmxXS0o5NVpjNmlpSDhubm9kdnZSR0pS?=
 =?utf-8?B?djVsb1pXRzllR0RsY0hTSWxqS3JRUHM5ZEhIa3pNSHJsZGNDWTlITWRGM3I5?=
 =?utf-8?B?cU9oNWljRVZGWXo4OVM5dkl1WmMrSHNYODhxbUhmVk16V0l2cnpoSUpHeEpi?=
 =?utf-8?B?NkpmOTBhZFVzOTFsWHAyZlprS2cvdkVwRDBFcDRsNDE5RWRNak9lbnhLWU9k?=
 =?utf-8?B?ZHU4SHNqZExEWXZYUWN6UjcvUE9BZWIzMkFuUUZVZkFlTU9jN2N6Z1dDNExp?=
 =?utf-8?B?TTBYVk1RRVZucE5tazVKb3ZYaEhkY05CcC9WQlhxTW44aXR1WUpTaitlQU84?=
 =?utf-8?B?TGFja2N0TlUxd1Z6Q3FZVmM4VGFsTzZkeGk4aXpncytldDE4YldsQ3pZcDgy?=
 =?utf-8?Q?ffi4l7IWNWxjYtJBCqwRvKXxc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3a6453-f1ce-4db2-c89b-08dd606c1dfd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 07:12:43.5134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbgJ5mamaMn5GtGHxGR7Z1r4cHFTNE0jlwWoGIW7AOmDHKdmR+C10GrPC4vk69mTFmf+ofBKVzvqlNRxHmCWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5578
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


在 2025/3/11 14:40, Bingbu Cao 写道:
> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Huan Yang and Vivek,
>
> I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
> buffers now. vmap_pfn_apply() will report a warning to complain that
> the pfns are invalid.
> I dump the pfn numbers as below:
> [ 3365.399641] pg[0] pfn 1148695
> [ 3365.399642] pg[1] pfn 1145057
> [ 3365.399642] pg[2] pfn 1134070
> [ 3365.399643] pg[3] pfn 1148700
> [ 3365.399643] pg[4] pfn 1144871
> [ 3365.399643] pg[5] pfn 1408686
> [ 3365.399643] pg[6] pfn 1408683
> ...
> [ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489 vmap_pfn_apply+0xb7/0xd0
> [ 3365.399667] Modules linked in:...
> [ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-rc2-rvp #845
> [ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS xxxFWI1.R00.3221.D83.2408120121 08/12/2024
> [ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
> [ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21 c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
> [ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
> [ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX: 0000000000000000
> [ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI: 00000000ffffffff
> [ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09: 0000000000000001
> [ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12: ffffb9b50c32fbd0
> [ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15: ffff941618665ac8
> [ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000) knlGS:0000000000000000
> [ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4: 0000000000f72ef0
> [ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [ 3365.399763] PKRU: 55555554
> [ 3365.399763] Call Trace:
> [ 3365.399765]  <TASK>
> [ 3365.399769]  ? show_regs+0x6d/0x80
> [ 3365.399773]  ? __warn+0x97/0x160
> [ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
> [ 3365.399777]  ? report_bug+0x1ec/0x240
> [ 3365.399782]  ? handle_bug+0x63/0xa0
> [ 3365.399784]  ? exc_invalid_op+0x1d/0x80
> [ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
> [ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
> [ 3365.399791]  __apply_to_page_range+0x522/0x8a0
> [ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
> [ 3365.399795]  apply_to_page_range+0x18/0x20
> [ 3365.399796]  vmap_pfn+0x77/0xd0
> [ 3365.399797]  vmap_udmabuf+0xc5/0x110
> [ 3365.399802]  dma_buf_vmap+0x96/0x130
>
> I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
> then I can vmap the pages. Could you help what's wrong with that?

Sorry for that, as I reviewed pfn_valid, that's someting wired:

/**
  * pfn_valid - check if there is a valid memory map entry for a PFN
  * @pfn: the page frame number to check
  *
  * Check if there is a valid memory map entry aka struct page for the @pfn.
  * Note, that availability of the memory map entry does not imply that
  * there is actual usable memory at that @pfn. The struct page may
  * represent a hole or an unusable page frame.
  *
  * Return: 1 for PFNs that have memory map entries and 0 otherwise
  */

So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn. 
But vmap_pfn_apply in there:

static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
{
     struct vmap_pfn_data *data = private;
     unsigned long pfn = data->pfns[data->idx];
     pte_t ptent;

     if (WARN_ON_ONCE(pfn_valid(pfn)))
         return -EINVAL;

     ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
     set_pte_at(&init_mm, addr, pte, ptent);

     data->idx++;
     return 0;
}

Do it give a wrong check? maybe should fix by:

static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
{
     struct vmap_pfn_data *data = private;
     unsigned long pfn = data->pfns[data->idx];
     pte_t ptent;

-    if (WARN_ON_ONCE(pfn_valid(pfn)))
+    if (WARN_ON_ONCE(!pfn_valid(pfn)))
         return -EINVAL;

     ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
     set_pte_at(&init_mm, addr, pte, ptent);

     data->idx++;
     return 0;
}

Please help me check it, also, you can apply this and then check it.:)

>
>
> --
> Best regards,
> Bingbu Cao
