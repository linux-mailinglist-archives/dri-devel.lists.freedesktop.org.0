Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF6319B3A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DAB6E536;
	Fri, 12 Feb 2021 08:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024E6E536
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ1sO7LKAWjLeDWQ6fBuUonfc6Z8XaWmkPaxer5ol/5wbkUr9JpKJl31oblPlSHqVK/y+uwGCSv6kPaHbaeN1kIwXbXJDiisNLQtayf1ShTI3D1DmNAEb2s5WCpkycX9aYMKpj6+yonCXA6AagvDCcuaJ42kzcIbMLyh2/WO7wOsnjZEm5xz9Bwa2BbdT+0V1s0ktGvbvlGs9lTLdBaRFSu1zpaSR6jT59icSmTjpvY9JvJ7Wb30DygNOzqGeaZPgpZABb4y+JsW0mlIxJLx52X+CSijZnFBKQY1pACNYSMQCRmw2T2sJUbsMxWhkkoG5cc/4Sz6eTSFJFiLe8Oreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqbJcsXXYqXcJhvtV1HB/92RAy72eyAa9Lds7x1reOQ=;
 b=HW3QM4skMmzO9BDGYpC7kltC8fnqpYnsoqKIRs2p40G5W98mtf1wv9q3eNlxZy1AhG6eJoYBerS+Xav3A9KZEsqXm1kGrMoZh0ash00FXCjfLNMUx07ibQRfzvcrxYC62qINCwuj5fvu2NR2esyCwHK/5saDCm7FoORG0CB2yHCxm98cCZDhgrUGmAmuI+q437aYPff/ASk9gd47TXOys9hxti/do0bxbXMiqKhVHI0fCFwJsViV2nZInaKC85y0Qci6JM5GUer/QsxfN8BG5/vHRBwhYF8d9Pu60Ozr61rRHlDth75nwX2aesJv/SL+CEYrk7nEX5EaCycloG7C+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqbJcsXXYqXcJhvtV1HB/92RAy72eyAa9Lds7x1reOQ=;
 b=PBuECjszmZrIvj99vlXyPfjS3ISQmEqpjzKQuiiydqOvFL8YGfhL3GyFqHiKLKkp7X4O7ekUOFcb63mCh31tcwCnBCenY39yqa1PfVX3yimJbsCG0q4fW4/zPm5dTMJAOoB50aolDcUu/9FL12wkYud1TKkFvMhGZhRgqxkVrn4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 08:32:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Fri, 12 Feb 2021
 08:32:54 +0000
Subject: Re: Not 100% sure if I correctly fixed drm-tip
To: Daniel Vetter <daniel@ffwll.ch>
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
 <87o8gqd4vw.fsf@intel.com> <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
 <CAKMK7uEAMST0dOzFDuRYoDh=QgGDQm-7qepfaF+wAnJwbSTGzw@mail.gmail.com>
 <64da0f52-e2e9-b7cb-d104-52079896041a@amd.com>
 <YCY78eKShg4/gfFx@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a7f3d7f2-dc1e-a109-b5f4-c74662ae6cb7@amd.com>
Date: Fri, 12 Feb 2021 09:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YCY78eKShg4/gfFx@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
X-ClientProxiedBy: AM0PR01CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
 (2a02:908:1252:fb60:5e65:14a3:85f5:f2bf) by
 AM0PR01CA0098.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Fri, 12 Feb 2021 08:32:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4005e791-71d8-410c-927e-08d8cf30cafe
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48138FD6BDA72029A8E5A87B838B9@MN2PR12MB4813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbKgYd7MvuIVox8LoIiF9NxD24kF3ZWlgKj8EbvTU5hUhgKqQUJ1JIIa2XqHsZELQeo5MYtGhNKjQQZCsL5Lcs3Nz+Kqb8o7ReKyQT2RB7pxDx++Jkudjtryz6qHzf1PUHdPFMSkHfY5/DsyHi3is97+ycGJaMzZvV2GS+jgFJF4XeL5j5xS2fCKuegEPeR+dOdZoKs1kigvzPsUlytiQek4zX9u+UoGDbFlt0eeU+ku9V+mWhVR2tOwR5ZU6HWDpxQ6LQuL2bp9dJKJZs8TxszWCscLwt2uOuZacqv6mUzNweMEM7x/l+x4Z11Gubc0hI0h0t2/GuooPw0HcwEL9E11iVLZYVum/aBuTuPrK1eSY9d321h5QPqSrydVbF7cRWl4+zIqSFufaRKzgdrJoypLmLqoKMghJPqZO/ItF7j16BGiy/e3nWFmpUptKflUeJiO1QjbU0chE8mJ00EQ96A4jZYtXKZTqxVo6ZuEOGLWwhFkAw6KC2KVJdU9iEoTjxWTZrFdm/Lxv5AHCiBwwTMm1aB/IqNYeDdgEwVbwt4waED/y/choOu23llLlnjhuCw6lfHNNr5zBRAKbHtbNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(52116002)(36756003)(2616005)(53546011)(6916009)(16526019)(8936002)(6486002)(316002)(66476007)(54906003)(66556008)(186003)(31686004)(31696002)(66574015)(83380400001)(86362001)(8676002)(478600001)(6666004)(66946007)(2906002)(5660300002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHJieW9WRE1veTVreEh0NGpDbmI5ZFYxYVQ5WFprWndaVDRrcUJLOTNoMUgv?=
 =?utf-8?B?bVIrRlhhbnJCSVNIcFJaSHhmNTRsY0VDbUJYMFJiZnZFUkFyNXU2bWhzM3Nw?=
 =?utf-8?B?c3VHWTdSSEo5MlF2Qm9tVVZVZ2haS3U5eTA1Z0ZZUjlrd2JvOEozWExRWHJN?=
 =?utf-8?B?QjFIZ1Z6ZVNwV3JMczlPNDlnQkNiWWJ1OXluTDQ0OE1GYmpzRGpFb3QzMllZ?=
 =?utf-8?B?VmVnYXR0YVpDTTdhWk1aZENwTmg3Z1ZnR0FjajlQZU5rVDlYaUJQUW5HWnF3?=
 =?utf-8?B?TzA0OXlEUFRUR2w4c2FXVDRkbVJtNTdJWmMrelg4a0xQVjZVcWsvQmc2clRQ?=
 =?utf-8?B?UE5DdXdBTitiUFJuOTVSL212eGZMTzBMOXBLZzE0UmVmMmlvMkZrWFQ0ZHBU?=
 =?utf-8?B?eGZicW56djFTSFJKdU5uUGVFU0h3dEQ4WHg4ek5rTTBjU3FETjZVRURQNThx?=
 =?utf-8?B?K3lwK3djWlRoOS9SZ1JNUlRmU3c5MFAxZGJQczNhY3JWSHNqYU1wNENBbFlI?=
 =?utf-8?B?WE1KbERVLzNnQVAyd0VuWE9YWnhNcFpGVmlHYVEyRitrcFFYN0ZiN28rNmk5?=
 =?utf-8?B?TUI4Z3R0L1RFQ2RndXdJTVFQaTdjN1llSTJGM1VPNkM4S0JBWHdycUVvSVpj?=
 =?utf-8?B?NHNPNHRwUUd4U3MyWjBxRDgwMmM2d0VvUEN1REJUWTAxUGZReUc4OTRpa285?=
 =?utf-8?B?M2pKdDluMnhXZTdYeUVlUjlZS2MyTXFUdXNUc1ppYnU5ZjlGV0F0a1JSWXFQ?=
 =?utf-8?B?WVVTSWtPNHR0WGF6bFN6VjNxN2pNOER2WlkzdFkwNittWXVlSEN0YVFUUjZE?=
 =?utf-8?B?aHYzd0N1dlpHcCtlOUQwVTBRR2JZdXFaWXNqQ1JmVGJrRDBUSlZhRENPYzN5?=
 =?utf-8?B?bXZQd1RDOGRnalhWdmdOT3AvenM0VURXNndtSzRmeEUwN0FFRHVKVTU4dFYr?=
 =?utf-8?B?SC8zUnRyWW00bGJ5MVgxWDh3eFUxL2p6UjZiMkVvMDBlRnNTS3hUZFIvNith?=
 =?utf-8?B?VXVOTTE2WG9xcW5neTY4YkJQVlBsTVZDRG1LZWYzSzh6aUx0T3N4MUQ0eGlu?=
 =?utf-8?B?RjNUUTNWNHlFbmUyWUtHNnJ3WmtZR3J1TXlsTEN1elRDN1VLNUFlNWNJTUV3?=
 =?utf-8?B?by96UmEwMVlpNlpXeW85RTU3M1Vhd0Q0TWVYU3ZzQ1ZQeWlSUHV0Qms3T3Z5?=
 =?utf-8?B?TkljOC9nRk1CQjBlSXdTZTFpUjFhcVpGQTBTbkZ4em05YmE5cWR6UzJwT3V1?=
 =?utf-8?B?RXYzbjA5SnFCTm4rQTRRRU4vaGJYZHhWVjQ5RU9seHdqc2VOYnBIZk1UWXBT?=
 =?utf-8?B?YU4vb0NEVlVINzVGaFZwTGxlN0F0ZDVQV00yaHBvMEFxNDc0ZEwvMjlJTlNC?=
 =?utf-8?B?ZnBhcndsc1UybG9JcjIvRjgydzFhOHhFclZ1RHZtUWVNSGdOeERBQmFzT0FY?=
 =?utf-8?B?TmJ3L0Z3VVNXTVloYVI0N2R0OXdTUkJnS0xlNHBhaW93S3orMlFYNFpMZmtG?=
 =?utf-8?B?bUE2b3VNdm9jZk5tWEdkcE51ditEK1BBM2xoWHZVYkIwZ3lkS3FhcTNDczRt?=
 =?utf-8?B?SGhDVU13cXFNcEp5TGQ4SzluMWdCajZWVnZaSXBNbmwxY1J0NVB0MWJOQ1Zu?=
 =?utf-8?B?VWFuVDFJRW9PM0d2VU84YmVCZVRabmU1TnpGU0lQcTVaSVovMnRHQkRFbzZN?=
 =?utf-8?B?L0tXbHhZd3pFdEJZNEJlOCs4TmU3L1lmZXM2Z3RoN3N4SGN5N2Z3WmZpd2lq?=
 =?utf-8?B?cVlydGFsUDJQdWM4MWx2QjZWVGhmV3BMT2lLTXNXQjVrbkZ0d2V6M21QdEVr?=
 =?utf-8?B?NStkSjRncmlSQk9PNGJVWjVRbWxmTWh3aG1sanlxM00xOElYbEhVcG1pNHNY?=
 =?utf-8?Q?15HJeal8UxJ2V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4005e791-71d8-410c-927e-08d8cf30cafe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 08:32:54.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aELd+WNo5N2QJyoCrHGeK3MPF6p4/rQyPryO2rGy8ul24/qcBJYOfPwDiY/npmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMi4wMi4yMSB1bSAwOToyNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gRnJpLCBG
ZWIgMTIsIDIwMjEgYXQgMDg6NTE6MTlBTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4KPj4gQW0gMTEuMDIuMjEgdW0gMTg6MjIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24g
VGh1LCBGZWIgMTEsIDIwMjEgYXQgNDoyNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+PiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEFtIDExLjAyLjIxIHVtIDE2OjAy
IHNjaHJpZWIgSmFuaSBOaWt1bGE6Cj4+Pj4+IE9uIFRodSwgMTEgRmViIDIwMjEsIENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4+PiBIaSBndXlz
LAo+Pj4+Pj4KPj4+Pj4+IEkgaGFkIGEgY29uZmxpY3QgdGhpcyBtb3JuaW5nIGluIHRoZSB0dG0g
cG9vbCB3aGlsZSBwdXNoaW5nIGFuIGltcG9ydGFudAo+Pj4+Pj4gZml4IHRvIGRybS1taXNjLWZp
eGVzLgo+Pj4+Pj4KPj4+Pj4+IEknbSBub3QgMTAwJSBzdXJlIGlmIEkgY29ycmVjdGx5IGZpeGVk
IHVwIGRybS10aXAuIEhvdyBjYW4gdGhpcyBiZQo+Pj4+Pj4gZG91YmxlIGNoZWNrZWQ/IEFuZCBo
b3cgY2FuIGl0IGJlIGZpeGVkIGlmIHRoZSBtZXJnZSBoYXMgZ29uZSBiYWQ/Cj4+Pj4+IEknbSBh
ZnJhaWQgdGhlcmUncyBhIHByb2JsZW07IGJiNTJjYjBkZWM4ZCAoImRybS90dG06IG1ha2UgdGhl
IHBvb2wKPj4+Pj4gc2hyaW5rZXIgbG9jayBhIG11dGV4IikgaW4gdXBzdHJlYW0gYW5kIGRybS1t
aXNjLWZpeGVzIGNyZWF0ZXMgYSBzaWxlbnQKPj4+Pj4gY29uZmxpY3Qgd2l0aCBiYTA1MTkwMWQx
MGYgKCJkcm0vdHRtOiBhZGQgYSBkZWJ1Z2ZzIGZpbGUgZm9yIHRoZSBnbG9iYWwKPj4+Pj4gcGFn
ZSBwb29scyIpIGluIGRybS1taXNjLW5leHQsIGNhdXNpbmcgdGhlIGxhdHRlciB0byB1c2UKPj4+
Pj4gc3Bpbl9sb2NrL3VubG9jayBvbiBhIG11dGV4Lgo+Pj4+Pgo+Pj4+PiBCdXQgd2hpbGUgeW91
IGhpdCBhIGNvbmZsaWN0LCBpdCBkb2VzIGxvb2sgbGlrZSB0aGUgY29uZmxpY3QgYnJlYWtpbmcK
Pj4+Pj4gdGhlIGJ1aWxkIGlzIHNpbGVudCwgQUZBSUNUIHRoZSBzcGlubG9jayBwYXJ0IGRvZXMg
bm90IGNvbmZsaWN0LiBTbyBhCj4+Pj4+IGZpeHVwIHBhdGNoIGluIGRybS1yZXJlcmUgaXMgcHJv
YmFibHkgbmVlZGVkIHVudGlsIHRoZXJlIGFyZSBzb21lCj4+Pj4+IGJhY2ttZXJnZXMuCj4+Pj4g
V2VsbCBleGFjdGx5IHRoYXQncyB0aGUgaXNzdWUuIEkndmUgYWxyZWFkeSBoYWQgYSBmaXh1cCBp
biBkcm0tcmVyZXJlCj4+Pj4gZm9yIHRoaXMuCj4+Pj4KPj4+PiBCdXQgdG9kYXkgSSd2ZSBwdXNo
ZWQgYW5vdGhlciBmaXggdG8gZHJtLW1pc2MtZml4ZXMgd2hpY2ggYWxzbyBjb25mbGljdHMKPj4+
PiB3aXRoIGJhMDUxOTAxZDEwZiAoImRybS90dG06IGFkZCBhIGRlYnVnZnMgZmlsZSBmb3IgdGhl
IGdsb2JhbCBwYWdlIHBvb2xzIikuCj4+Pj4KPj4+PiBJJ3ZlIGZpeGVkIHRoaXMgdXAgYXMgd2Vs
bCBhbmQgY29tbWl0dGVkIHRoZSBzb2x1dGlvbi4gQnV0IGRpbSB0aGVuCj4+Pj4gY29tcGxhaW5l
ZCB0aGF0IHRoZSBvcmlnaW5hbCBmaXh1cCBpcyBub3cgbm90IGFwcGxpY2FibGUgYW55IG1vcmUg
KHdoaWNoCj4+Pj4gaXMgdHJ1ZSBhcyBmYXIgYXMgSSBrbm93KS4KPj4+Pgo+Pj4+IFRoaXMgc29t
ZWhvdyB3ZW50IGF3YXkgd2hlbiBJIHNhaWQgdGhhdCBkaW0gc2hvdWxkIGFzc3VtZSBwYXRjaAo+
Pj4+IHJldmVyc2FsLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoYXQncyB0aGUgcmlnaHQgdGhpbmcg
dG8gZG8uCj4+PiBOb3RoaW5nLCBpdCdzIGFsbCBzdGlsbCBicm9rZW4uIFlvdSBuZWVkIHRvIGRl
bGV0ZSB0aGUgbm93IHVuZWNlc3NhcnkKPj4+IGZpeHVwLiBBcyBhIHJ1bGUsIHdoZW4gcmVidWls
ZGluZyBkcm0tdGlwIGZhaWxlZCBhbHdheXMgdHJ5IGFnYWluIHRvCj4+PiBjb25maXJtIHRoYXQg
d2hhdCB5b3UndmUgZG9uZSBhY3R1YWxseSBmaXhlZCB0aGluZ3MgKHNpbmNlIHNvbWV0aW1lcwo+
Pj4gZ2l0IGNhbiBhbHNvIG5vdCByZW1lbWJlciB3aGVyZSB0byBhcHBseSB0aGUgcmVzb2x1dGlv
biBmb3Igc29tZSBvZGQKPj4+IHJlYXNvbnMpLgo+PiBNeSBxdWVzdGlvbiBpcyBob3cgdG8gSSBy
ZW1vdmUgdGhlIGZpeHVwIG5vdz8KPj4KPj4gRS5nLiB3aGVyZSBjYW4gSSBmaW5kIGl0Pwo+IElu
IHRoZSByZXJlcmUgYnJhbmNoIHVuZGVyIHRoZSBmaXh1cC8gZGlyZWN0b3J5LiBUaGF0J3MgYWxz
byB0aGUgcGxhY2UKPiB3aGVyZSByZXJlcmUgc29sdXRpb25zIGFyZSBjYXJyaWVkIGFyb3VuZC4g
SSBndWVzcyBkb2NzIGRvbid0IGV4cGxhaW4gdGhpcwo+IHdlbGwgaG93IGRybS10aXAgaXMgcmVi
dWlsdCA6LS8KCk9rIGZvdW5kIGl0LiBkcm0tdGlwIGxvb2tzIGNsZWFuIG5vdyBhZ2Fpbi4KClRo
YW5rcywKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFuLgo+Pgo+
Pj4gSSdtIGZpeGluZyB0aGlzIG5vdy4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+
IENocmlzdGlhbi4KPj4+Pgo+Pj4+PiBCUiwKPj4+Pj4gSmFuaS4KPj4+Pj4KPj4+Pj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
