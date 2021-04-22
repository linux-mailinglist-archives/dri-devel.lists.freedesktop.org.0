Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D93368012
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 14:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F36E220;
	Thu, 22 Apr 2021 12:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61FB6E220
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 12:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdOAitXLwwRdioxrgwMvq24fnVzn+LqAtGuDYEkVzt2CVE8qxZqsiACUloAIlAd2txrvOoMw0uZi81ZCjUtfCpZoIhXaOkNHIxfrQHXzWBZiVV1HQqUjWK8ELD6anIUkf1liKOPD0wKV1miSOROZB6EL2NzYE/A4tJYrX64FXsa8EnsTIIOm723SEXMTuT8hox0uimcDMF498rMPHzqctvYI9BKzYNkiQh8y+re+xXoJEJ35v5hKusLM65atTgh46j9x8xeuk+IOuP04SdEGPSjmApY2uD4dSGmCWcAQOzOoZKhDGk6M/W8YndEyfgUJmDaonUIlK6kNYYNQ4U+sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FVPT5eEuphjp0x6Vx7p9Xa3DeEvv2vcNswkyU5zFa4=;
 b=f/07I6hD7LhboI43fSK1do0PkXrPTBJS8oaEjznqOhAmKDry2MehWkLFSuQGZ2f1SiBYmJ2sgV4XZ+vEtUT68vVk1aY6voCUMaayUIxIKoG0rYMa2CqZ5ofkuiWA+tttrceeEVJxtBupA5tXS21I6BEQnF0v+G1nj75mN1zP3Aj9CawOJNgGqDdwsGaXY98kWjBEZt9FlakCoXE7m7qscgT5Y6eeThHExa8rtBNU/hk24QUeNEGkgRu8PiG/H7nqTWag8bFUAt+y1eaw/qPOOQ0SoZ0Pbrfiu3nt7AiHrSGCiV946ZDeDTprBlQGRbpepJTl+U79bi2IuFjOmksCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FVPT5eEuphjp0x6Vx7p9Xa3DeEvv2vcNswkyU5zFa4=;
 b=aSyD3tNaPNSXbH+zMv5rWHD4wlNc1FZ99D9i29U2CRU+C+6Lq0One5mKQqGRD2bIjM/yIeVWsxwQFMtxRzXQISsuR6+LlTEgQGnM4gdPW0k1vPElTtI4L0ETbj68WnwSQku4YZVXrMBmpl1Jp85LvmzlV2KNjOZsfDVqZA4CXUI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 22 Apr
 2021 12:09:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.022; Thu, 22 Apr 2021
 12:09:36 +0000
Subject: Re: [PATCH 27/40] drm/ttm/ttm_device: Demote kernel-doc abuses
To: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-28-lee.jones@linaro.org>
 <e5d30ac1-3037-0101-0e1a-9df6a8580c70@amd.com>
 <YH6Wiuy/Vw1Et4Kn@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b0be3dd8-bfe2-6b9d-b6e5-71e3e5b3cceb@amd.com>
Date: Thu, 22 Apr 2021 14:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YH6Wiuy/Vw1Et4Kn@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
X-ClientProxiedBy: AM4PR0902CA0004.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
 (2a02:908:1252:fb60:2fbd:d2a4:da7e:4526) by
 AM4PR0902CA0004.eurprd09.prod.outlook.com (2603:10a6:200:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Thu, 22 Apr 2021 12:09:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee09c3cf-f97e-4b5b-71d4-08d905877f4d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4391DA64ECBCEBFB064A1C1983469@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY6aPMDpIfDc1WTQdg/cPXukbcikU8YbkWf3snfYzuW0ZgNqRP68XstKk6S79ycUCDECHWgNOuBbEq0Rzk1lwjY9OcB1E7f0GKR//kF7l7snvY+xTyubYnctWAoBRzIqI4dWejYXYL9Ac9TY1d2mRfDWfATYdVtp6pKK7d8pMrG5stKxdet7ds7VdSaJHYwZZzOJ12gMAi4yvSYfVS6RCKIg4WMLAXZChSEibyQYmeg71Rjbo36N8HFR0zr1vxYbGmwaUCZpt0TPpoX5NcYU9rWEMnfRLxxzrRV9w3llxVb0aCugLgT+qT41Tc/7+yqSHMB6CbhqPuo3bY3lRK+4EnC2CSrGbqOkg9/SxeayKynDGmIS2p9xGuKdRyM40/xs0XM+SyCTb/va07JHP4OPp4G2HHeGBQSivPbBlr5zb4+50cKZuviGxlUYSXRwdAMc0Lx5hdkYE70sNbMmOT3EQhlHTkTBDJacEUks2uY4dmz/X9/Itb4Oq4rgKIs4m0BokiDYBFhC1Je3uiwH1YIxrZAEmwDEIbkFwZO5193mzBP2ap4HeEQHc7zYYRHSjAHwujtmXcRgSGNTPkZg+7te4VJbZ5+xf0LD43VTRLAj1xZtkDV65EEdacRrEG26o60ieMOorhmbElgpTHuv9onQ/X9+Ncqxt+1z6GBMZOTF2wHGMpJzJ5b18zuGZhKGTPOL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(31686004)(31696002)(316002)(86362001)(83380400001)(5660300002)(2906002)(2616005)(66574015)(6666004)(478600001)(52116002)(8936002)(8676002)(38100700002)(6486002)(16526019)(36756003)(66476007)(110136005)(66556008)(66946007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzM4SWl3N2NvOFRPY0E1aHp1SDM4Wk9mQklWdFYrUlBLWCtGckRMNVAwM2lv?=
 =?utf-8?B?QVhoL1lpZVJLUko1VFcrRjZaVzdORUtpWmpvRlh5WWdhemJlNmFzajRhTG1y?=
 =?utf-8?B?cGVRbExtdFdEbFg5eXlDQkpJYlh2U3g2enpGTVRHTWlIQkJUZmpWbS8xbzMx?=
 =?utf-8?B?NW96SjJpdUpJbTEwVkpUU3J2eUV6d0UwMVBoS2dDYnUwM2RtY3NlWXFjNU5W?=
 =?utf-8?B?RlF2MlVjWmxZYWtwM0huSktwRTl1cHZlUDk3d2trKy9FYnZSNHVtM01hVjRa?=
 =?utf-8?B?K0psbE55STA3dDluRnlPMVVnRGY1bHVWd09IRDNHWW5LK3k3OFZzODV1T0cx?=
 =?utf-8?B?QmI2aE9IWUlqTVBXeVlEb1c0OFpYM2hlRjN3Z0FUSkF4R3dzdjdoZlRFUkNO?=
 =?utf-8?B?MTJLc0ZqT1Z4WHFzSnh5cXc4ZndtMTBXdUY0Umk0SjJ1dTVEOC9xRmRTSTcw?=
 =?utf-8?B?d2pobkFiQmxHaUFLSEM2bTFvVGVhb0dMZkZ2WFZFTlNNMEk3WVpOOHFxSllE?=
 =?utf-8?B?QS9kL0RWY1phMEpGQldxY0ZTNTRWbjA4Rm1NcnRiTDArRTR3VlFlWW82WlZT?=
 =?utf-8?B?UXdYdlgyNFNrcjJzRXI2eCs4TEZIS2Y3cVYwYjM5QkpZQkVWYXFrMkwyOTlz?=
 =?utf-8?B?NDAzVU5ZaEtZeHZkejlXeE9WVmFpcFRxeHhUMTVBSXRWdjd3Zlkxck92QmZK?=
 =?utf-8?B?cFBId2tVcmpUNjRQbnJqMGZFcUdVMWxUem0xYXFaekEyRUJvV0RPUzJUWWI2?=
 =?utf-8?B?MjVsbk05QkV5Y3laS2djUVRseXBvUkRzS1BweVJMb1J1cWp5L2tFelE0M1hE?=
 =?utf-8?B?V0wrZnIxTys3RldiODgvTDROYk02bTA1eVo0cjRqVmROSmFSUERuZEZ0V0ZD?=
 =?utf-8?B?NDMvd3E1bHROaHphcnJZbW5Gb2F5UGE5MFIyR3RJVEgvWnBRN1ZWcjZxVXZ5?=
 =?utf-8?B?bVh1TUhqd1czVWRYU3BvS2pkMlFBbjJYQm1KSlBObE5sR1FUcHR6KzAxOUg1?=
 =?utf-8?B?SS9SWC81Q1U0SVQ3TjNaTWk0RnlHbzZGK0NhVGNZaG1TZjQvbDdXZnI5Y3Ja?=
 =?utf-8?B?RnUyaS82eDNYSUpzT1JTcFJ6WUZYalBDcDVYc21vY0FJRm1oYWVCeHNMNzRI?=
 =?utf-8?B?em50RmNrK0paK1pVVjBEZ3l4UUF1bUNLeHgwSExuYjRIVDRsN1hQNHNMTHdJ?=
 =?utf-8?B?alFqaW5Wcys1djhiRzVsQk0zMzA5RytIZlRESVJTYSt1a2ZkZ1I4dVMyOUJs?=
 =?utf-8?B?bXRpWWxhSVlhWm1NbkFaOUlield6ZHlXamJmV1B0Y1NCa2t4U1ZyTWY1WnYx?=
 =?utf-8?B?bkl5N3Rqd0JDMWZXV2N2aXF2QWZ3Z2U0YUQxckpwRGVEZE9LamZ1QUxmV1Fl?=
 =?utf-8?B?ZHdyNDJ4RVpnYlBuTWdTc3R1WEV0Y3BpbzVrWUhzb0pPRUdBZGJ0Sm80MStJ?=
 =?utf-8?B?MEZHenRWYTBmL1o1dFhhQWVwWmFQNjN1azVjSDVndHl1U1hFUHYxQWtIN3dQ?=
 =?utf-8?B?eGpBbGRUR1F6am42YjlhRTFGNEhpU2hlWi92OERUSndKVjJGYzJ4WVBINktr?=
 =?utf-8?B?NTZPa1V5TXBLMitYQ1BpaUt0VGwyTE9qMDk0dDhKbW1PMXRqM2h0UVJxbDZD?=
 =?utf-8?B?b0krMmNIaFh0ZkdlV2VCZE5jMDZRR25mSDlDRHE4YUN6bUVmK0R2TjQ2YWJz?=
 =?utf-8?B?ZVFmdElwYkcwbVN2UktKS0RnbEo0NEJHNUYyL2Nwc1lwdTJNcmZINXZ4Q3Vv?=
 =?utf-8?B?QUcrREpuOEExOGxIZnRWZzdRSUxIeW1xNjlsZ3VaQ3g5R0Z2UWFXUlNmMEI2?=
 =?utf-8?B?WHcrMmdpeTdYNyt6UkhGRHNlUTVLVTZ3MFRqZDlKalNGbTNSM0dsZG9XZlJa?=
 =?utf-8?Q?sc6XHgBnOegdz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee09c3cf-f97e-4b5b-71d4-08d905877f4d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 12:09:36.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12uT3EKmrXJe0jNQ+YluzLPNFBw1nFmuU8YG1QSlb+6W2U0rRd52SpM0Q56LWS7w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyMC4wNC4yMSB1bSAxMDo1MyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgMDU6MzI6NTJQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4+PiBGaXhlcyB0aGUg
Zm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPj4+Cj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYzo0Mjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAndHRtX2dsb2JhbF9tdXRleCcgbm90IGRlc2NyaWJlZCBpbiAnREVGSU5FX01V
VEVYJwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmM6NDI6IHdhcm5pbmc6
IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIHR0bV9nbG9iYWxfbXV0ZXgoKS4gUHJvdG90eXBlIHdh
cyBmb3IgREVGSU5FX01VVEVYKCkgaW5zdGVhZAo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fZGV2aWNlLmM6MTEyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdj
dHgnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9nbG9iYWxfc3dhcG91dCcKPj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2RldmljZS5jOjExMjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnZ2ZwX2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICd0dG1fZ2xvYmFsX3N3YXBv
dXQnCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYzoxMTI6IHdhcm5pbmc6
IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIEEgYnVmZmVyIG9iamVjdCBzaHJpbmsgbWV0aG9kIHRo
YXQgdHJpZXMgdG8gc3dhcCBvdXQgdGhlIGZpcnN0KCkuIFByb3RvdHlwZSB3YXMgZm9yIHR0bV9n
bG9iYWxfc3dhcG91dCgpIGluc3RlYWQKPj4+Cj4+PiBDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+Cj4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+Pj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgo+IENhbiB5b3UgcGxzIGFsc28gbGFuZCBhbGwgdGhlIHBhdGNoZXMgeW91IHJldmll
d2VkIGZyb20gTGVlIGludG8KPiBkcm0tbWlzYy1uZXh0PyBKdXN0IHNvIHRoZXkgd29udCcgZ2V0
IGxvc3QuIFdpbGwgYWxsIGhlYWQgaW4gZm9yIDUuMTQuCgpBbGV4IHRvb2sgY2FyZSBvZiB0aGUg
YW1kZ3B1IHBhdGNoZXMgYW5kIEkndmUganVzdCBwdXNoZWQgdGhlIFRUTSBhbmQgCnRoZSBzY2hl
ZHVsZXIgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dC4KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Pj4g
LS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYyB8IDQgKystLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+Pj4gaW5kZXggOWI3ODdiM2NhZWI1MC4uYThiZWM4
MzU4MzUwZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5j
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+Pj4gQEAgLTM2LDcg
KzM2LDcgQEAKPj4+ICAgICNpbmNsdWRlICJ0dG1fbW9kdWxlLmgiCj4+PiAtLyoqCj4+PiArLyoK
Pj4+ICAgICAqIHR0bV9nbG9iYWxfbXV0ZXggLSBwcm90ZWN0aW5nIHRoZSBnbG9iYWwgc3RhdGUK
Pj4+ICAgICAqLwo+Pj4gICAgREVGSU5FX01VVEVYKHR0bV9nbG9iYWxfbXV0ZXgpOwo+Pj4gQEAg
LTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgaW50IHR0bV9nbG9iYWxfaW5pdCh2b2lkKQo+Pj4gICAg
CXJldHVybiByZXQ7Cj4+PiAgICB9Cj4+PiAtLyoqCj4+PiArLyoKPj4+ICAgICAqIEEgYnVmZmVy
IG9iamVjdCBzaHJpbmsgbWV0aG9kIHRoYXQgdHJpZXMgdG8gc3dhcCBvdXQgdGhlIGZpcnN0Cj4+
PiAgICAgKiBidWZmZXIgb2JqZWN0IG9uIHRoZSBnbG9iYWw6OnN3YXBfbHJ1IGxpc3QuCj4+PiAg
ICAgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
