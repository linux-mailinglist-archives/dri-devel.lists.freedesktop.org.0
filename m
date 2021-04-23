Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18312369D4E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CEC6ECAF;
	Fri, 23 Apr 2021 23:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A96ECBB;
 Fri, 23 Apr 2021 23:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fltm9Qkhtb8etwIbIv2qrPl4rycX2GT6lwr9fZpCfKl6cEYsVJ13gtmlCXbstn3hQykXH9B3aFdpHMbM4s9tmDxXeB0O97JXvf4k6zHjoia9ZpH+QVYTSP17WyqpLjdD7a+pCurZx327MtFtjXXkILGeZJRZvpg2Gn9hpJK7F/mpZjQ2MVOJM8PgpF3Dk9cJsLwUqquGqkhTZLhtKPCOuexkYeMr3j9/BF+jdlEcsSCSI3DQnqYBwbZmQo13hTn7c84tlT9Ha8p9s81Wc+JHd1u3Y7Upd6XOU5UbOHy1HAqUEwVfs1zMe/jYfblNX/j8pIMnElMZdjPKcXYVP52rCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tmv7VuJGuPKzxcHB2TB5l0P5KzrjYhjR2Y7I2Cejflc=;
 b=l1+uTocrP/dSeywXBQZt3R/7M1a99StlfoyMxLlEuZ2j7mSBiYj8mR218i+FTeBEuFhnOTDlOujfkp7WHpkj1mMpky/JtUyaE/nZnFzH1yMqs2oJfcwdQo9OD7SCwA2f3fGLckBG0A6OdAYzD+wgvs/AGZZUgMhPMUZHZHJmrtl/vbwd0qfFpo8sOEuq1SfXFTvUJ97ga6vVm4PRYCP/Ydmx6E+Y3tz1FivjD6IS0xR9yfBxEcsQyf4fG1S0U1b5ADTx3x5MaE07pvP/b7wEajFoqg0dADP/KOQFcGAuweYKYC8sS7GpDu6TlznJqI86s4DhRf9rPTXULAL2rWAuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tmv7VuJGuPKzxcHB2TB5l0P5KzrjYhjR2Y7I2Cejflc=;
 b=Vuu9oUVEmseOtYiipfU4N9r+9b+Q7/QCVYg0sLrP9ZQli13gk4bio0b+Ngr459IUxe+xBsqPzh467ww6WoVpr6JRjdNhguT0dq0/QVZI1IGQA/WL65uWKQ3FMfOcvoSIdKPCtYryBhh6pPoHfdFuuyFt1VYLI2dIfQVO85teTSE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 23:33:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Fri, 23 Apr 2021
 23:33:58 +0000
Subject: Re: [PATCH] drm/amdgpu: Added missing prototype
To: Souptick Joarder <jrdr.linux@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, evan.quan@amd.com, Dennis.Li@amd.com,
 luben.tuikov@amd.com, jonathan.kim@amd.com
References: <1619213997-5475-1-git-send-email-jrdr.linux@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <da39ded9-7222-8530-2388-aef3879d1ca3@amd.com>
Date: Fri, 23 Apr 2021 19:33:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1619213997-5475-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YQBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::37)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YQBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Fri, 23 Apr 2021 23:33:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8cbcdd3-b470-4274-87c4-08d906b04440
X-MS-TrafficTypeDiagnostic: BL0PR12MB4963:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4963A64EEBC9A337ECE8D8E492459@BL0PR12MB4963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPkxmpg8hNu4psIhVgxR5s2WJvujdIrhHaHPDe6ZUT2a2+DRIcT9fmDRZ3qQqdaBrimMAkWkLAk3vnsNpl8xVhnMcxLI8hS2xmUZrrQG/AYtjX2SkdkRTq5nKRSXgjqbPUEqIdxeY7tNGzdTnohWbu5jJsrs6f1JQuVSOR2XDZGl+JsrP+xsMatOoTAVNiYC5VYIckcPrvZYrvvZlQdvhviHgL4FTeAULjz36M4NN8KpK7qUPLVGt09YJgWN5ENxEW0Q1yozHsm/4bZcL7C3E/HqoJ6ijpLm0+p7tp9UteL4gValHXBA50VjjzO/gfFWx0OPd0qOl2IqwAaukiFcD0YSLSx5RQTqHrMTAE3VO+8jSf2TU+5T9xTavHIjgNDPuFBIwyNfQunq9FN+2dTHIss5teGsA7ldtFbPfi0KwrBFKYH9ScVUbB6pkPdLWIsa2xzn62L1rde02XADJyv4KkDxDfZxRVkbtISLjxzhaDLL/0Gmy2SIur5dElC8aHpNzDG8TOSpMK+Zk9ZCK6ibf5lEu0GTt3l8id3KYp8YAHIXtNZcY/lr9pNhTSESJ7fMTD9/8ww0e6oJ7GJQHtFj18wdMSa+5oo7Zvzgz1liiGyv4/pubMKXHhOSB6yIOYr8IiWoKCqMshQSIjbWC5Wq6JenZg7YtmmSBuI8AbEZQYHgdn/OOiCrnS3KSCPDn4nRTOuLNxbeT2CueBDubbdLdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(8936002)(36756003)(2906002)(38100700002)(186003)(31696002)(4326008)(83380400001)(86362001)(6636002)(26005)(5660300002)(16526019)(2616005)(478600001)(921005)(316002)(31686004)(16576012)(44832011)(8676002)(66946007)(956004)(6486002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1FQYUU2MXVQeXN1MXNad0xPTndadGVQNFNReDdJWHBCcTdtWFNOa3pHUktK?=
 =?utf-8?B?Z3hZalRQY3BBc0wxK0RQZmh2NlhwcEVXa3RxME5LeGRtdGN5N25ibm05MUpG?=
 =?utf-8?B?ZzUwV2FQRzhDUGFvdUYxL05IUHFSa0ZaWFVTN2RCTit0Q3Avd2VuQURVV1dE?=
 =?utf-8?B?N3lXZ1pTY3V1cE9ISk1yTGZ2Qk80eWwrZU01bmx2MkFGN3d3MElVYUV6enNx?=
 =?utf-8?B?c0VpYlVxTUZqNnJYZ1NzL3Zxa01qbytKNStoYi9KRDkvMWo2OENGNmtBdG96?=
 =?utf-8?B?VG42ZWRPZWZpQ09VMjVISmlrK05rcE94YlhjSCtXSmxBREZWR1pQOXFSdzY5?=
 =?utf-8?B?TXlQVkMxK041eFZUQzhIOXpXU2JKMUZ1TE9jaDI4dU5sV3FTTXVYYTdXYjNk?=
 =?utf-8?B?S1ZRNEZQTS9vQlFzRnl4Nm5QaEloMThmd0VwR3dXRGUrMmRHdU1WOGhhL0Nk?=
 =?utf-8?B?MFU5S002NzhkVVNFZDZVdEllOUtKZmZXaVhsSUNITFlsYTZYM3NDbHh4cmhx?=
 =?utf-8?B?eW9BQ3k3WTdUSUNHU3pZUnBXQnd6dWtiU0kwaCtQemZxOXhZRmxxTFVPdzBZ?=
 =?utf-8?B?bWhLaDQ1VS9nQy81Z2t6eXdYQkhGWTZDU244a0hwbU4vTWd4WE5wcVZrbFFU?=
 =?utf-8?B?VEkrR3BNdFhiVjhneEhmUU5Sbm9hTVNmSzZteURURlRWa3NuM2ZPYXRrcEVJ?=
 =?utf-8?B?SFJRZm9HMWpZcU9mN0N3dkRFTld0dzBxbmJFSmdqTDJ2Rm5qdFhJdXBRWG9J?=
 =?utf-8?B?R1lxT1BVVTU2OTlvVjBIMmcrbE1qa1pZWlkzaWFma0VBN1VIVHlsNmo3RUhi?=
 =?utf-8?B?VDRkVXQzLzZxOFg5TWJZaVA4ZTdqSStFSUpiUmFvZmI1TVRoeDNobG9zcEM4?=
 =?utf-8?B?WkdmS25ETU5mRWQ4d2VIQkFrRGJjdnFCTjh0ak5ORW44eE05ekFITjd1Y1RN?=
 =?utf-8?B?MnAwSHRNcWJZaURpY0FTbW0wZWFZZmlBWE5wSDhBWFBYcW85YllxcDlBQnFB?=
 =?utf-8?B?aDhwK2ZoQTIwcjNLUG1mTXBpVEhKU2hKdkpIZmtyVnA2R1JXRGJUcExJMVl3?=
 =?utf-8?B?QnVrRCsrSTJlWGtyN2h6UUhPRlFMbDgwQmNmUEZZZHJFanJtSlp3SXUyajBP?=
 =?utf-8?B?VG1FZFFzYW1Wb0NETmJsNnBXQ1lHY1J0TjA0TGZYNnNtYXRZNStwUzFSMndn?=
 =?utf-8?B?Um1EdUMxakp0bFlTaVh6OXJ0TmRwS1ViZkVwVzIrcFI3emowVTN2WE1KTm9s?=
 =?utf-8?B?UlJuci8yY3JnVk90bHRxUmQ5RTRWQzdKanQvOTk0UXJFNm9UazZWc3R3aFRo?=
 =?utf-8?B?VFFuVTd1VjdZQWphSzhra210YjNmV0NybUl1a2MzMXQxckpiUHZFcGFsWlYv?=
 =?utf-8?B?Z21EenRsSWc0ZXNkTyt6WFQvSndCYi84ZDN6L2JnbFZFd0w0QlpIc09QcHBL?=
 =?utf-8?B?M0x5eDZrQTBZTXlYWWh1QkkrRUl4WE9BeEd3VXJrSStBVmU0RUY3MUpJVXJ4?=
 =?utf-8?B?UTJOWXpURFh6ZEt1Kzl5WlhHT2FrM1F1aCtLdytNbmVCU09tWWpFUExId1Vy?=
 =?utf-8?B?WldiY0JWR0cxU2U3SUs3YWEwcmduTU96NTROeEpyWXZwamwvWmNjcGNZeGJp?=
 =?utf-8?B?RFpJd0swRHl1NWtRdW9BOTk2OHZHZERpSlV3SXZCelVKT0swYlNkcGdsN1Vs?=
 =?utf-8?B?NXdmZnN6djVicDg4K3pKT1pZMWdlUUE1a1I4aTc2UnZQNVpLaUNVNG1DU2do?=
 =?utf-8?Q?jZy2g5rSJG0bj2XF1HaR0mwmoQomdbOgiqUeMUK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cbcdd3-b470-4274-87c4-08d906b04440
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 23:33:58.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbeHWc9f8UiNDgo1/mXaCX1xl0Y968tYOVxK2w+7hRmzZH/dv78nkLbBbzx4kDk4IzXPsbXr7cLAIv07xQD3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yMyB1bSA1OjM5IHAubS4gc2NocmllYiBTb3VwdGljayBKb2FyZGVyOgo+IEtl
cm5lbCB0ZXN0IHJvYm90IHRocm93cyBiZWxvdyB3YXJuaW5nIC0+Cj4KPj4+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuYzoxMjU6NTogd2FybmluZzoK
Pj4+IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2tnZF9hcmN0dXJ1c19ocWRfc2RtYV9sb2Fk
Jwo+Pj4gWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAgICAgMTI1IHwgaW50IGtnZF9hcmN0dXJ1
c19ocWRfc2RtYV9sb2FkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQKPiAqbXFkLAo+Cj4+PiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmM6MjI3OjY6
IHdhcm5pbmc6Cj4+PiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdrZ2RfYXJjdHVydXNfaHFk
X3NkbWFfaXNfb2NjdXBpZWQnCj4+PiBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gICAgICAyMjcg
fCBib29sIGtnZF9hcmN0dXJ1c19ocWRfc2RtYV9pc19vY2N1cGllZChzdHJ1Y3Qga2dkX2RldiAq
a2dkLAo+IHZvaWQgKm1xZCkKPiAgICAgICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2FyY3R1cnVzLmM6MjQ2OjU6IHdhcm5pbmc6Cj4+PiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
ICdrZ2RfYXJjdHVydXNfaHFkX3NkbWFfZGVzdHJveScKPj4+IFstV21pc3NpbmctcHJvdG90eXBl
c10KPiAgICAgIDI0NiB8IGludCBrZ2RfYXJjdHVydXNfaHFkX3NkbWFfZGVzdHJveShzdHJ1Y3Qg
a2dkX2RldiAqa2dkLCB2b2lkCj4gKm1xZCwKPiAgICAgICAgICB8ICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+Cj4gQWRkZWQgcHJvdG90eXBlIGZvciB0aGVzZSBmdW5jdGlvbnMu
ClRoZSBwcm90b3R5cGVzIGFyZSBhbHJlYWR5IGRlZmluZWQgaW4gYW1kZ3B1X2FtZGtmZF9hcmN0
dXJ1cy5oLiBJIHRoaW5rCndlIGp1c3QgbmVlZCB0byBhZGQgYSAjaW5jbHVkZSBpbiBhbWRncHVf
YW1ka2ZkX2FyY3R1cnVzLmMuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU291cHRp
Y2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IGluZGV4IGRjM2E2
OTIuLjhmZmYwZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IEBAIC0z
MTYsNiArMzE2LDExIEBAIGludCBhbWRncHVfZGV2aWNlX2lwX3dhaXRfZm9yX2lkbGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIAkJCQkgICBlbnVtIGFtZF9pcF9ibG9ja190eXBlIGJs
b2NrX3R5cGUpOwo+ICBib29sIGFtZGdwdV9kZXZpY2VfaXBfaXNfaWRsZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPiAgCQkJICAgICAgZW51bSBhbWRfaXBfYmxvY2tfdHlwZSBibG9ja190
eXBlKTsKPiAraW50IGtnZF9hcmN0dXJ1c19ocWRfc2RtYV9sb2FkKHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHZvaWQgKm1xZCwKPiArCQkJCXVpbnQzMl90IF9fdXNlciAqd3B0ciwgc3RydWN0IG1tX3N0
cnVjdCAqbW0pOwo+ICtib29sIGtnZF9hcmN0dXJ1c19ocWRfc2RtYV9pc19vY2N1cGllZChzdHJ1
Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQpOwo+ICtpbnQga2dkX2FyY3R1cnVzX2hxZF9zZG1h
X2Rlc3Ryb3koc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbXFkLAo+ICsJCQkJCXVuc2lnbmVk
IGludCB1dGltZW91dCk7Cj4gIAo+ICAjZGVmaW5lIEFNREdQVV9NQVhfSVBfTlVNIDE2Cj4gIApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
