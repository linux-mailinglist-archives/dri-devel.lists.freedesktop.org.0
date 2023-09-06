Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18E7982D9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EBF10E86C;
	Fri,  8 Sep 2023 06:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02olkn20814.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::814])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944E10E730
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxISNAipyJsC14VyNKijSKtIVaaYqGLpNKKIUcvsGEDWUL3JWQKzitEfcCtblF0q4Q2V9mU37xe2fvAtjQyZOxOcj0sqb/nZDhdc/6I8FB3gumtlGOnwjwcTHpCBwi33KKZXU7bRkvb4vj9CYj6C//NeEGwbLzSd0MNwle81vTSnS/D8LV0kwTh0GilbuGyEsMjrpbRWgj6sCNqt5CG/20+cC0ICDaUWSYSbR+TIro69h7vUQzl5er+QZLkoxcAZc+f0nHnkeK3kunAYo77rxecJP5YB8+nzWqbLSGZtuwKUBEu5i0c48QiRlNAuagdzx/hM8As/S6eKs35ErX4Edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syKM0IeEo77OclyB+pNHvqY1fdh/1NQohcSY+nPVDgk=;
 b=PY3H584d5flH3c+MXIR5uKAkA2KS8sHkik3Zira+lGMZYZnAKuyEefmMEWIW5193L33nfn4nw/NAVg8RXums5xcH5umGdIc+8uH3+FRRVaheHTadZD221dJ0xkm2hCiaa/kto12t6A/obOsYf8FrIyUz2gveH4i3A+rErE5ctElSDrlasFrtb3X/wZnp73s/loDdkXrANa8Rf8E11WkoknbiuFxwpxSb2VQP1lfCByjhYmhvYKXvhz2iWXufUa2t0IqymDUVzIgKBPlGx/Ot1SlJPQhBzcdKJeXWHFlW0QkSBj+1YX5VcT0xrmYLFh2htgJrBOfM92tHAQaosXuLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syKM0IeEo77OclyB+pNHvqY1fdh/1NQohcSY+nPVDgk=;
 b=FYn4obxorxn2bmVcuJVFN9ijUifrX5s8GuvJjFbmbmNYumy8xeae/2PrA2fdCoW1BkEzaps+vv3rP1GHdGYOOhWD/POMUU83iyJ/dyfJ67LOpOp3O1nJjDb6G7EtKOLlxvrODKnKzb4tZ4qTgqxOzt7jVlFaXAx3NloWK8O49o11p00d+Wj1BJ1BexCDj9eR7PoRWmBMn2LqSt40usfEVsph9pPxSsYa/66KgGVqvD4bRtIbrrWM+C+o5/l2BqQSMpLN8Q7qz+4bw4p5sHgByQeLhdNsEeZazAx/afZ/n2OQw+zqXlYuckrCEMhPmVzoCNKMTwNXR72jhik9qkDl1g==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by AM9P193MB0917.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 22:16:57 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 22:16:57 +0000
Message-ID: <VI1P193MB0752A8088A084373A73D2A6899EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Thu, 7 Sep 2023 06:16:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <VI1P193MB0752635EE197F2BB14A2D87499EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <da7e44fac65b2c73c9f1000a2c1d9c75d931a9d7.camel@vmware.com>
From: Juntong Deng <juntong.deng@outlook.com>
In-Reply-To: <da7e44fac65b2c73c9f1000a2c1d9c75d931a9d7.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [gaW5anShvbDkl8Ss46I5NQ2bce/XCfBx]
X-ClientProxiedBy: AS4P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::19) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <4929a4fb-4274-4b48-87e1-255c0aed76ea@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|AM9P193MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ab60c9-7bc1-4134-3ea3-08dbaf26fbe9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUXE1k6xFDIHyYTf2pxdhIt+khxQtdrSfxWPxd9mVwGPvV6m4f5bncPzXu5zIP9P5tGPE6jZ5U5GARSM5IVZn3s7y40AO4Jbn85xk3RIGwn5DBoLO42MR2wSdEUI0qI95PKD95SeFOO48+VfwJGXub9TXNJ3LeCp0Ia4RDJnTAfDJH/k7hUAyk31ouCQqanzBDDuXp06uxKzlUrMYlBCzrByr1kDXgJrSlgwz0s7c58EEUFgWQkb/JPMS4AdqCIvJ928IxGyj0dRLN4xK3UfzbUTrLZz/2Ve3UIFncr1YfaKa4WFppGYlIsK2VvAe8RwhaaS0/wadGs/PsUJyWHJOv7xA2evqPe0w849U101W4mzfMBHPVN0vBKGAuYXo0aEYvtLMFkaFGbgl8XoF1mZWg0YXpKcD4BnfXXj7lhLiRC4zEJk15eCSJP09l1E1BU6o+lhh5Dm9pwiCYNhwKMNYrIIj46BbjNRYjkdN2ie8QPvhim2Z1WZ7ZqPnjytYa5/7HCzhy1JTIbXyjzsGyKE2CBOm0cCiwn3HwghMzdsq6QTe9x1JQsKaPnspN4rMdzs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRWWlMxZ0ZZSU9MSHp6dlNTdmZRS3NzalJhZUNQbENkeTkxRDBjWDhVSVFI?=
 =?utf-8?B?RFpHZEVXam9IeVZaeGppVEV5bC94NjNpNCt6aUk4K2U5dFA1Y3JaWDRMc0w2?=
 =?utf-8?B?VWMzeXl6MDZkQ0c2dGt6MnJ4REEwV1dWcE84aTBpZnVYaytpemlWUUFhcWpt?=
 =?utf-8?B?QnAvUWhVN24rdi8rVDZtSnFpU2c0d05UWGJvbUFQeXZsalpQUjJUMnhBS21s?=
 =?utf-8?B?R1pMa0NpdkplK01ZaldIcVg3NmlrdklseVBITG9TNS9pZnNQSzRSUlNraUJk?=
 =?utf-8?B?QnoySyt5aUVCcHRzMEVhWVo5VFdHQmR1MHZZSCtESEsvNHZFWkx3SlV0QVNY?=
 =?utf-8?B?NzF3RDJwVGkxa2l6MG1DSFROeUNFbWg5RzhCZVhGMXVXazBtOG12QWhKenVw?=
 =?utf-8?B?M2pmZjVocHBKUTM5UFF4ZTVkWTlTeEx0Tmgrd0o2RWk5RTQwR2U1ZTZEV0p2?=
 =?utf-8?B?MmtUbmNLVjNqbEN0YzAxa2gvOXEzRFkwTDk2UnRDOWZkaEZnbEtFcVVIUzIv?=
 =?utf-8?B?L0xEaHNiUHdHWnpzQlQ3TGQ3RjRERkh0R2Y4NjdrQzFOd2NiZGRrWHFEK3hI?=
 =?utf-8?B?K0Z6eXAvcjczVGwrNWgwbS9idTFERGUxQjN4RnlOZytrc1J3VjFvVUZtWVd5?=
 =?utf-8?B?bjdJYW91bkpXc1lHNk5peWo3aTlIaG93ZXloY1h1WVpmdWRiZVYyL2cyMU9l?=
 =?utf-8?B?WWxHL01rOGJocno5ZGVmMjlJYXQzc2NZWjh5YVY3MUp4eGNmR29IakFiRE5z?=
 =?utf-8?B?OVpENlQrcmRNRGhTZXZveEtIV2JGQStacjlwc1VqbmhxSnlzNkJpQjBNcjlY?=
 =?utf-8?B?aG9NSEZ5TlpWRVBpTTVibUs4aXFkZFY3RHozZ3R1MWFHZXM0NUVrZTBTb1RB?=
 =?utf-8?B?eEJWVmJtZFVUb0g4MFNvdmgxVDFlaEFzSnFSL21JRDRUU2RoZkhXRWNqUzlo?=
 =?utf-8?B?MlJQaGhscG83TXVGdEFEbGhxVDFaRFhWRkFRTC9JOHQ4K3N0TmFCZTVodVFs?=
 =?utf-8?B?WG1WYzBINEY5RDdUSUIwaHhnZU4rbS94MVEyODdYaXYwK1ZjTG82VTQ5RDk5?=
 =?utf-8?B?VW9IYmZ6dFhHdnVvZFNMUGYyZnBNUWpRck4wMkxOVThrbXZGNS9BMTNVSU1D?=
 =?utf-8?B?Q1BJVWdVRFRhRDgvelZURW9LSFRWUHZKclY0dFU4eEg0VllPbWs2Q2NTZUE1?=
 =?utf-8?B?VHozcVUvTEdLS0RjS2ttMm94c05SQnVGN1Rva3YwZ29pYjVPYm9BSDhPT1h3?=
 =?utf-8?B?T2tYWFE0Yy9uZVN3eWU5L2tza0pIR3ZSeDIwSWlWd09OaTRzK21sbEpxZGY3?=
 =?utf-8?B?K041cTN2bFk3eVd6WjRaYzdOck9sVU42bDgxOURDVjdEdldWZ2NobkFqVXdI?=
 =?utf-8?B?NUhId01mN293b0YzVnJycHJyTmFIMU11TTVacXRrdC92UCtVWVhWSmZ0ZEVu?=
 =?utf-8?B?dE5pYm96aDJTWU1CSzJXVWJQclJVVUxxRHpyYkN5Y1JLdlBJV0x4VFBUdDdV?=
 =?utf-8?B?OXFuaUdXNHRuY0ZqTE80MU5tTUpaVTd1YWM0dUxsZkl6NUNMTGRXUkhydHR5?=
 =?utf-8?B?T3h6bVNBUlJHbWRyM3RtUCtvb1o3RklHUE9KRHVRNU1xQVc3NXNmSlM5cUlX?=
 =?utf-8?Q?tsQ79V6tfaBltKrHQFzpCSIEb5Fvo1C4g0DhGt1L30/U=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ab60c9-7bc1-4134-3ea3-08dbaf26fbe9
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 22:16:57.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0917
X-Mailman-Approved-At: Fri, 08 Sep 2023 06:56:24 +0000
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
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/9/7 5:13, Zack Rusin wrote:
> 
> Can we follow the namespace_action naming convention here? i.e.
> drm_ioctl_flags_check instead. I find it a lot easier to look up/memorise the api if
> naming is consistent.
> 
> z

you are right!

I will send a new patch.
