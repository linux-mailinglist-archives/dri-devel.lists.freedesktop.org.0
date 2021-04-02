Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E01352B18
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 15:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C926E04E;
	Fri,  2 Apr 2021 13:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54266E04E;
 Fri,  2 Apr 2021 13:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg8pw/+uRhdDiIUnUYbBSnNS6eyIlTQJlwiWD5eOI/RqKWJnlyHtS89dgKEf1/pgVGBIfqWvkou9aIJt2BiS4fYpAmF569/jEdnWMZfZNyX96eORaMUG+o4jD+x+Jy63K/Y76qWiy+iyqwUT8F3dAbHTMeJnEvkHGCKHVkrAxK9OAdncrl7TrYaYjcTh76fJaJpEbg22YkGgjRE7skvRK88807zwAhT/tfjrWg6gKR/rq9IztSMnih4sVCEW1gg4g/Dj4srOP6eN0DYUn6jrm459E02RkLkKhdwFNbbI8uNCe/7HEIufL6MqpZEdaGjn3QwbBuDiu0itrMvHF6WONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHh7N1s93yhElyR9yysSLqUYkX9msWnrNVeeWPQjcho=;
 b=ZzUKjA8XOJndNDtVvEYBSUMqvX7KNLGOz1xoY7LYlOZbhnmOkP6GJTMNeBEh3ck4F29duIw2gfkXJN8oGmmcppftXvTv8EQzsPaPJ8Zga69FjbeKRM/AFsF6mpueOV9VWnO1HaqXMcu9QnWFqSSzNyrUk4hww/ZDbgMchHXdMzODBMo7eAhwwDcCO6++l5A5PgfuacuuLIdK+/xAvvJwyuDOugEVFgDyB4OEAyEsMnmXu/K3EXMjddkFOhceDtitI9fTMikpQU+feOvLj5hHx4MEXK4ECZUzzDG3pmG3HRQHYROrFhbyZmbeXuilYhLEE51/kkP3LHcQ1z5f9JPh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHh7N1s93yhElyR9yysSLqUYkX9msWnrNVeeWPQjcho=;
 b=uVcGWDPFWTJLRs2xZIgj5ayLGRJzxZCge4QMI6JbBj16t+HsdK8nF3zn9djSbCmVXH30MwJTC+08f6AtNj3LSf0B0aMFUL75/INOXdiNXJ3c67xNUWJ8JioEQlK9PDBpY6BJhpb+1KpSPK1NIlv3QMs8ro1sFpQiFTMlYtevhVQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 2 Apr
 2021 13:42:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 13:42:36 +0000
Subject: Re: [PATCH v1] drm/amdgpu: Try modify this line into a
 well-understood code
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210402025539.58125-1-zhangzhijie@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4a6fb93e-c5c5-3628-e470-92f5b301e3c8@amd.com>
Date: Fri, 2 Apr 2021 15:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210402025539.58125-1-zhangzhijie@loongson.cn>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:242f:cf66:3716:ed]
X-ClientProxiedBy: AM4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:242f:cf66:3716:ed]
 (2a02:908:1252:fb60:242f:cf66:3716:ed) by
 AM4P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 13:42:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90135821-8cbd-4d85-943f-08d8f5dd2cd1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518959F4E7BB5D2E4A4B404837A9@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:289;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTxh/aRKTCK1ihiUSvXnUSUF2+oPMrutpjYnzDmdk4myDY6JHtYl4b4ncbLHlkj9H/1m12UHS2Xxi3Kw12dy3NYJC3EF7CqVEExu+/VgmDPczjiVc68VQfbZ1VhgLEhRcfx+WnYBLj5RzZu34pfQnRQ6rh9jpMXeaTqly2ZHoTtzcvV5Age5mbNFS/f0M47kiMdccX845DI6LFgIRUb06YBmM6xcdNzEkSIgtoXMSwdTlJa02YhCypTwbbXRwXKnw2j6TH6r8lzsui6ydyo4H3MQFWmG5oDKDUYDDFD/68hOwLeTP/R+dddVxJGObJU5Ii6gjbkwJwMR3GvPLW9hZhzo/9nK1Uos5gHhaxtJqvk4Vju7uvzyfdj2mGLl3AqeW8RGQpt7lTJSAA52FLy6/mXiyD2MAS4Nv5TRosSLVEhK82uZOv8x9gBA5TyWtNvY8qIdqWetTaQPBFq9yLCB+OAzAJ5220HEA1nthH3G4+QL0BFrmPPfjTZ5nOanIIEMj/DBg+pp7zFEOJu5KiYLhVJuK717qopyu8vsRPoFAlvgM7B8t589M7L6t6KGIYZstSPmI93NXxuE1YPrTfDqvA9J5cMBV8h+YiSi4NSvOZZ84xmVVdGqreor0LDT6Q2wlq2IR30AGfWpzzlilKm3ASOcNjtoh8EI+CSMBuGlrPbKLd8zQI0CclocRHCS7oStg20XnV+lGKn92aJKazds0fQfFLEDUpA60RstOULIKH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(6486002)(83380400001)(31686004)(66574015)(4744005)(8676002)(2906002)(31696002)(86362001)(2616005)(52116002)(16526019)(38100700001)(478600001)(186003)(36756003)(5660300002)(4326008)(66946007)(8936002)(66556008)(66476007)(316002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1JWbndBdTB4YkZDYkQyYjlpTFR6Q2pOS2ZpNTRsQ3ZOcVh5RGRXRWlyQTRO?=
 =?utf-8?B?YWJJek1aV3JSQTFQUFhjMnA4NUxkelVCaktyOEIwUm8yWFR3U21lYlMyOTBa?=
 =?utf-8?B?eWNKM2t1eHJ3d2x5NEJGTFdQejVhUkszQ0U5WWZHcjE3dGttcTNwM0M3SFgz?=
 =?utf-8?B?YitWWkJUeUZxc20rRWZxL2w1UldKMDhPdzM4VXM4QnhwSlJ6NDZINUlyQmFr?=
 =?utf-8?B?WDlFNUVHZmpORDR1WWlNMmdCUnIrNkp2eEtVa0lHMHFVN2x4R3cwUmtzZ0Ri?=
 =?utf-8?B?dVpUbTM5YlVWV0xuazdsWUI5MkJBcXA0ZFF6STBoSHp0RmpaRFVxektWSUZ5?=
 =?utf-8?B?MEJuczh5bFJlUXlHL2pyd05YdnBsQTNPeU94MEdvVFN2SlhNUWdxR3RTZ3pT?=
 =?utf-8?B?dmJlTVgrN1RSdFUzNkpxOURkWFRULzUwMnQrLzlvVVVVQ1J3NnB1OElGTE1Y?=
 =?utf-8?B?NDlmUmkvajcrOURBRlArY1oyMkE2RmQ2N0xzcXRZU2hYWnhpRFVNU3hDSWtQ?=
 =?utf-8?B?OUt6eWsxckp0d3ZYMzRtMnp0R1piMkJXREZBREFkT2FqMU0yc0VSVnpISkg4?=
 =?utf-8?B?NkdwREtLck5wY0h0RUVqUUxNaU9lRzJXRFZQbWpkWTUxQk9ybWEvMHJINnJo?=
 =?utf-8?B?WlUyT2hGZEd6RXJFb3IvZ1V6eUtGeUgzdDJLVHp2MklyM1NyanBkN3BCSUlW?=
 =?utf-8?B?QzAvaTBxYVFjV3BCdTBaaVBoVk1uejdMS1hjQnZlcjQybkZPWEYwaVZaY0ZU?=
 =?utf-8?B?Vk5WTlVEeVlPL2xlaEo3TTNTWngyeFRuaFl0d09SSlAwRmdGa1BaYnB0UnFQ?=
 =?utf-8?B?RE1QLzA1WnhYUi9qSlZpbFp2b01UUXlNSVFOVHFqbENlTXYwa2szUnBDdkg3?=
 =?utf-8?B?aysrVFBSdzVwSm93cmVFcVcrRmlsN29PSFJXa0pORXFBNHUzak55b2dWUzdM?=
 =?utf-8?B?RzdibEVzRDJ6WmNKUWRyb0EwZ1c2V096Sm5DM25iVk1NNU1tZHdnaDcvaDll?=
 =?utf-8?B?cm9BMTZMVUZuMTdJd3I1ck1tRGFBdThtVStkcUtoVTBkL0dYTkVvUDcyVWU0?=
 =?utf-8?B?ZHZIS0VZQ21uc2k0SkIzbnp1d3ZsN1d2ZmQzTk10UE5YYWQyR1hWcmlmZ1NU?=
 =?utf-8?B?SGdidGhFbkc4elA3MVFxZUFUL0l2clovRWlma2hIOEgzd0JPb29MeWVKVmtr?=
 =?utf-8?B?cTJnektzNlBoYzFWbW9vUUFrRUJSNjU2UmVyZDNDczJtTFQxbUtTY0hZQXpN?=
 =?utf-8?B?aFB3YTFXVThnVzhjMGNnMkJnaVFQY2hjMEpOYk1GZmk3V1k1YjdnaVg2UVJD?=
 =?utf-8?B?QVNJL2RreU9ZUHNZU0Q1aUFUUFBGR25KT0lES3I0R09aU3ROVVR2Zk9BV09l?=
 =?utf-8?B?R051dlhGd2xRSkgvUUlLZUQ3N1Y0RjRGNk1NUG1IMG1Fby9kQ1hzSXVFVmpM?=
 =?utf-8?B?SlNlTEgvR2ppSkt6LzJTMUIwajVVYWhHNFFxQml5SXNJTkJIVjFkSkFQeFRC?=
 =?utf-8?B?THFmeEllWHlYUFVFNExSZElVTEFVSXhtSHU4SEMzbEtSbHY0NG5vcmFKMWF5?=
 =?utf-8?B?UTI3cFZlMERhM1hScEJpaGI5MDRmKzFpQ2NSVnNhNkJaVk5uall1TGhWVGNE?=
 =?utf-8?B?MkRkbmxwdGo2M2hWaFJMS05uR2lraU13VlFHcnp0VjlKS3ljSTRJUmZzcDVv?=
 =?utf-8?B?UEdlSXhWTUE1a2VkZTlwUEhRS3ZKVnRaWEhVdjRibDNFTm1DdC9SMnoyTDNi?=
 =?utf-8?B?N1NTZHZMdWVhRjJhV0hJZTg2c1MvcTFza1BETUxFSUZjb3dNQjFuMmYyNXhL?=
 =?utf-8?B?akpQM0QyTXRJRVFyM2RHKzhrSzNHY2pZa0M0VDd2RU83OGxFSmdQUVV1WFJG?=
 =?utf-8?Q?RjQBGSUfrxbXr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90135821-8cbd-4d85-943f-08d8f5dd2cd1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 13:42:36.5183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llJX8L5PcmMyXjWv0PPmPVEJTmw2JUSs4G3COHjK19Zt1ZMrZ8HABkPJ8Of3GF9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMDQuMjEgdW0gMDQ6NTUgc2NocmllYiBaaGlKaWUuWmhhbmc6Cj4gU2lnbmVkLW9mZi1i
eTogWmhpSmllLlpoYW5nIDx6aGFuZ3poaWppZUBsb29uZ3Nvbi5jbj4KCkdvb2QgaWRlYS4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4g
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBpbmRleCBhZDkxYzBjM2M0MjMuLmY3OWFm
NWZiNjFkYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAg
LTI3MDksNyArMjcwOSw3IEBAIHZvaWQgYW1kZ3B1X3ZtX2FkanVzdF9zaXplKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBtaW5fdm1fc2l6ZSwKPiAgIAkJCW1pbihtYXgocGh5
c19yYW1fZ2IgKiAzLCBtaW5fdm1fc2l6ZSksIG1heF9zaXplKSk7Cj4gICAJfQo+ICAgCj4gLQlh
ZGV2LT52bV9tYW5hZ2VyLm1heF9wZm4gPSAodWludDY0X3Qpdm1fc2l6ZSA8PCAxODsKPiArCWFk
ZXYtPnZtX21hbmFnZXIubWF4X3BmbiA9ICh1aW50NjRfdCl2bV9zaXplIDw8ICgzMCAtIEFNREdQ
VV9HUFVfUEFHRV9TSElGVCk7Cj4gICAKPiAgIAl0bXAgPSByb3VuZHVwX3Bvd19vZl90d28oYWRl
di0+dm1fbWFuYWdlci5tYXhfcGZuKTsKPiAgIAlpZiAoYW1kZ3B1X3ZtX2Jsb2NrX3NpemUgIT0g
LTEpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
