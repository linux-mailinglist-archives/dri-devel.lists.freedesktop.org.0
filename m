Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C82B52AD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CF289A91;
	Mon, 16 Nov 2020 20:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F93389A91
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFiG9Z8puoCwGDxeoHG9Yrusa5HCvYoKS9B6inr3I7leLMuUpw7IAIgeT/p8sXRt+O1l6ytscHIqGhqB2bf6PsdoSxw+nRifwFOmjYYAae/HI+Nn005WW+VAI9+nqxDd9WrL71uSIw7iUKmTyUJOvtHFgCJe/RCszU3Z8ojoN7HV+Oypbiu/PvCRWuyVsFGsDC+DOE9M67uGEdtxaQ62fJK/KezXQ/CKhc2AfxMNV3tfUisRpvVexsfKEIwuHpC5aNKfgx0fv0wvG2UNJ+dz5feMDU1VOoxBtjnVv9gxTdbKph5d/DFw1tH6euw/jH+qjFvIdHYugU8c3oRxzH7iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBaEUnZe6Nd5+Ds0fxMVyyOF5KUoW19MdyIO8eusano=;
 b=g86okH4FF0L3nV3t8kAZY/S7wYAy5xWAeu9lWryTaNN930URkeMzXKplXU0mPluYRvZPV3CcvGhWxL4i9Fu44RRmgxHkorrjf+IcmMUGHBVH+WGgbFQDB11pnfZgu6v93UorAICRsMYWIiHNLimM+PLqLorr4VUKT05AgodAtUwuxocMrdf/oh2/9Xwnm8UlyTb+TSw6GiT+ISPaDS2RaCGOZPfusBzyFVcreXf95zqarC/X1vjdqDxSwu36XdbryrN7q45c4Swxf9jwJmiW1KXG54ph3auFKOPYLVEZVCul4NyOFXXVKiYLlDOhHWEv4xYD4w/7hS0ETc/+IOoS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBaEUnZe6Nd5+Ds0fxMVyyOF5KUoW19MdyIO8eusano=;
 b=Mhl5whHeO148uz5zuOsFbf6gokRbqop5mDhkkTVtw1nAwk7ZO3gpWxWlGNxg99tKY5Q5sC0knYZHdOM6sNDZfwz9TKu3BqYcSwflQGjYKkYPqGE+MO+12jW8+0l/iASDrFhSsJmIfH+XiZ6jexal2N8ii6VbY5/CUduQNMUQ5HY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 20:34:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 20:34:41 +0000
Subject: Re: [PATCH 33/42] drm/ttm/ttm_range_manager: Demote non-conformant
 kernel-doc header
To: Lee Jones <lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-34-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b334d3e-d890-4648-dd35-54449c4b6a39@amd.com>
Date: Mon, 16 Nov 2020 21:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201116174112.1833368-34-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0096.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Mon, 16 Nov 2020 20:34:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25623463-b1f5-41c3-2f8b-08d88a6f0b23
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239CDB0A41F245DDF5101EC83E30@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dmkxL+ngMOryhArBGVZxyBlOa9Ei8UaoB6cSEXJT+udREwndOKWvlb+W+QXG5povjEqQibN8KDtBfO9MmVM5DmTzsglqrRGf+B1wJI4W/lXYrGdngabwLLvhoO7cOlD3GENdI/ztBstGQGFJztR72/luW29ThBdL1mFVxfB6yhYDWohYi+oUzDUqmirck8JWT/Nx2Fca/Qnyh8enx91pLK2GEcQngfs7OtnejxIe1VHD6EeyUFi7YuWXEV9Do6+gL6uRDh2T0CDflgDAo95USohgopCz6njHULFFPdjqHTikkEdn6UDkZqi+OcsTLNxSPTidEh2G3hSQ2VlnxojVuvw1p7sOXEAV8Mx4iN9Tkdfb4WMBvmDlgv/ZY8qDH+Z8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66574015)(8936002)(5660300002)(316002)(66946007)(186003)(2906002)(6486002)(54906003)(86362001)(2616005)(66556008)(66476007)(16526019)(52116002)(8676002)(4326008)(6916009)(478600001)(83380400001)(31696002)(36756003)(31686004)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzFUZE5KLzcxNDY3V1hDclRDVmYzano5RFFtL0xNZ0MxaGx6YXdtVVJBMlVO?=
 =?utf-8?B?d0p3d3kybkxIaklNcHgyT3VURE1KVURMU2dxNFdJVWxHWWJ2YnZnQitMTS82?=
 =?utf-8?B?c0dHcVdkblhjVGUydDdmckF0eWlTTFlnaGJxYUkyZkUvMDQ0eFdLbTE5N1ZF?=
 =?utf-8?B?VXNiZnNPbFBHK0FtSGpiUE1xdUdlR3h1SGM0VldzSTJmV0RzSVVVNmsrTEJU?=
 =?utf-8?B?VCs4ajFSM0NIaEZ0V1l6bEZxc245NU9ZdDZ3L2JDZ3BGVHN6WUhBRVVwakc2?=
 =?utf-8?B?ZytQOEppUTBmNU9UK3ZsSGc3R0VKdHk1Z3dwdVBsUEZzbUNYZEFoeXVYNCtS?=
 =?utf-8?B?RUV4bFVTb1JMa3VSRG9pSG1HeFdHaDlZREN2Zk8reEVPaDNmempRZ3BRQWdH?=
 =?utf-8?B?TTcvQTZ4ZDBpNm05S2pnRlBFQVVPaUgzbDdOckxoRU9uN2V0NHR2RHV3OEYv?=
 =?utf-8?B?c3ZXQStxczMrRkwvSVc0YnNJWTl3eEU3d0N2YnpUdlBZeXBKaWpvQmxqM0pC?=
 =?utf-8?B?VW91VEhJSWFCcjVpNmxRUGdndkZXZzcveitxRk0wOU1ka09PRGhPcy9TR2hM?=
 =?utf-8?B?QkN0YkcrN3BvZW9CR1NCZUgzVXRJY1k1QlJwMDFsSmhyWmdhOFRGVkNqbmJP?=
 =?utf-8?B?RE95eHlJZjlZaUxqeFhUY05uMlp5d0hBc000aUlrTWhBN3h1NVI2S0I3VE5U?=
 =?utf-8?B?WmZJUStTVlhoSHFFN0o3dXRJSVdwTFpSZGJtd01GL3ZxSzRQZGkwRGQ3UGNi?=
 =?utf-8?B?LzQvMTI2SGdPVHlIL1pyK3diaTVNdXVZdlFSSGZVdDhVRlVaam4yQkp3Z2ty?=
 =?utf-8?B?TWhTUG43T2dqWVhGVVdMalJKRlZ4bWpDOVVUc3ZENGdiYUNNbGpEdVByUFUx?=
 =?utf-8?B?T1UyaityVnZmcUpzR0lFT3lBbHJjcGY1NU1rUWNSVnVvMGZ3RysyOXFDS1B5?=
 =?utf-8?B?YktQTWo5by9DN2FsamxjSTZnMUZHY2Nra2hqVER6ZWd0RnNyWk1kK2N5SDJw?=
 =?utf-8?B?THpiQm1XV01uazVMZWZSeE92aUt2akNQR2dpdjVoSlNHT21aQkxmeFRiZ2pH?=
 =?utf-8?B?OFVkbi80THZxQm5zelhvUkZGWk83Z2tLdDVDVlBkYmlwOW4zcjgvcUFrei81?=
 =?utf-8?B?MFVmYUFzcTUrdFU0OVJGemVTdHZ4TmM2Y0ZxbzlZcGN3dytaMVA2TUl5NTdJ?=
 =?utf-8?B?R0xudE5lNngvZ3QvMjJ4cDRBSzlSL3NUY0o4eUlWZkZFcDkwQnU2SXNMVndq?=
 =?utf-8?B?a2lRTi9Vc2NIWHQzaEN4QUljaTZkYlVBU2tMbW1lcnpZMUc4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25623463-b1f5-41c3-2f8b-08d88a6f0b23
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 20:34:41.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmxL94UlsEhFO/HjIuyw96uvFWxm6ZL1Bop/RsytNv8PuGQFs+iwPQaklQHpn4ZF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTEuMjAgdW0gMTg6NDEgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3JhbmdlX21hbmFnZXIuYzo0Njogd2FybmluZzogY2Fubm90IHVuZGVyc3RhbmQgZnVu
Y3Rpb24gcHJvdG90eXBlOiAnc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICcKPgo+IENjOiBDaHJp
c3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFu
YWdlci5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jCj4gaW5kZXgg
ZWE3NzkxOTU2OWEyZS4uZTA5NTI0NDRjZWE5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9yYW5nZV9tYW5hZ2VyLmMKPiBAQCAtMzcsNyArMzcsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4
L3NwaW5sb2NrLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICAKPiAtLyoqCj4g
Ky8qCj4gICAgKiBDdXJyZW50bHkgd2UgdXNlIGEgc3BpbmxvY2sgZm9yIHRoZSBsb2NrLCBidXQg
YSBtdXRleCAqbWF5KiBiZQo+ICAgICogbW9yZSBhcHByb3ByaWF0ZSB0byByZWR1Y2Ugc2NoZWR1
bGluZyBsYXRlbmN5IGlmIHRoZSByYW5nZSBtYW5hZ2VyCj4gICAgKiBlbmRzIHVwIHdpdGggdmVy
eSBmcmFnbWVudGVkIGFsbG9jYXRpb24gcGF0dGVybnMuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
