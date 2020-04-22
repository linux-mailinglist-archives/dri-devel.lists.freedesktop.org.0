Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6711B350C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 04:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34A6E400;
	Wed, 22 Apr 2020 02:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CA76E400;
 Wed, 22 Apr 2020 02:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV34iB+UzKPY5oJzKrUDBg73qTxmsWueJaZLF8vjDVlgTV1fH4o68KPbtGWJWYh8wfRsNF+IUAZ3tlgvtZuKIiseGGGd0Z0Uunr60evqY8IXawv87Qarb/SrAYAZywzaa9msGbmxUT/hd+1mzbsQpyGsBMbFJvBXSqdafK4Wzy/Nl+//1BgDJx2E7eigbDNdaEcLdwvxS/lc/YCjOZyO9Qtr9809RAXc+YYdL32LN2BfYvl7K142EZsBCjLAiNTrBEz4akE7/Gp8Wt8TECZNB9t4JGXFXVx6OXeF7evS6L4/nUWoa0noHZlYUFBkO44e6RkItui9CLc/9wketBZU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gEAf3FfvU4u+UHJeR0OMF5JozqCFY1AsVUY7XQo1hQ=;
 b=KC6aa2QA6cCFnrhR0Nydpim7xp4D08qWwZz6S+f3EcTyo6f8MadZQ/alLeUH77X71oAaXOSU5Wmad+vA8ethd9wDqqmdYmnbO8JNG6jjcy7r4R4MNID/KJ5GCa6t904VXNvUx6U4tUO3gI0RGvov4WScsyL/ri/UyQ82VLLSK9IgXzzQm7kOeZznJ2zlty0mSlA9jH7BKvNnLWo601r+3grvh6ppjJii/lHdsD91GsAq5fn+O5zIuSurCrvQpBL3+wCizsooaw6XBuU5dOYNS8/ESO7P+WhY4wNUJ/hYrNsAF1phXBEIMvAUeccaXBoONSpw/gwZL1EAVrrwL8nXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gEAf3FfvU4u+UHJeR0OMF5JozqCFY1AsVUY7XQo1hQ=;
 b=DKg61iHT6LLLTzYW1uyyWsTLslZKuhp40Mw8ae5MGVKUP+I2nlWOlk4sbSLEijTGyx/ihgR1P9Oh2vAiJKtV4I2a/cXnSqbmKjoddMRPqDMdB4X1WtXmbScigsqC03N+xIKjwC3L0LLaQatRsfvVOXgchVthQ01YB+I8lyn7+SI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2494.namprd12.prod.outlook.com (2603:10b6:802:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 02:35:38 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806%7]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 02:35:38 +0000
Subject: Re: [PATCH v5] drm/amdgpu: cleanup coding style in amdkfd a bit
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200422014618.4020-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <33574896-c858-8929-aeb6-24ff4dc26b5b@amd.com>
Date: Tue, 21 Apr 2020 22:35:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200422014618.4020-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.150.44] (165.204.55.211) by
 YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Wed, 22 Apr 2020 02:35:37 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01318721-b96d-4916-405e-08d7e665d788
X-MS-TrafficTypeDiagnostic: SN1PR12MB2494:|SN1PR12MB2494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2494B2EDA787E3837079FB3392D20@SN1PR12MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(478600001)(36756003)(81156014)(2906002)(8676002)(45080400002)(66556008)(186003)(16526019)(16576012)(316002)(66476007)(956004)(2616005)(66946007)(44832011)(110136005)(8936002)(5660300002)(31696002)(52116002)(86362001)(26005)(53546011)(66574012)(4326008)(6486002)(31686004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbV8aj1yienlknJTvkxCfo2p42L8+K5gMUb37a9zPupheaZT8oatnvrSGAT3Se0n1Kj2Ur0AeOLo/syg5teXFipW6mrSokqWZUxrgU1tNAB+wuYLrKrE+oIOqnbElFeELawYDniQZGlcfIvJeQEUtPAYYmMnbJJIZeEmtdCRh5T5M53Ux6wx0rdjQO9vrrYL5RNHBIyrZoRAtDlSquW5onSYes/XMUhDSKAEmfh8PEcBCoCTQqYZElVU+vs07fC+ozgVwhaWv2bxgt08mdu7qWOfKQgNw+rVlCz5e/9DJk5HcZK1T3DW8x8eXohm0nOowoA4qsioOfJN3C28RJRXP9SPPLjsomwGgRW/oX2nA6NbrMOPnky4e5JdrCCWvN9G3goC9EWej4oaFK7WhuJaldLZfkHuY84WD7XiqcJJnW4GHCMAmSq5XJPZLs1XkOMGPzS5pQgpG2aNNZ22xS1Nekjlp9AolA3nHP2k7WbNBLpZ6XN0SwoM7TekmSrusHEiDkacGwne/liZfgZF8kIjUA==
X-MS-Exchange-AntiSpam-MessageData: tMZB5AQPAzwvBnGY51vUNO0uGVJ4knG/6WUdJOTB3Mvlh5rQ3+zzejqTH68fUysYlPMl+wREgkea0B7M/0gk3bMvoIJwBRSOCrFDWnZq+7VMiIc1bbFiJGLEzidNw+twYJvfkG4ODemrfu1u+Pxd+A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01318721-b96d-4916-405e-08d7e665d788
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 02:35:38.0679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpYTzhCC/gzhWAZSCwdmDuNI/GqLoo0OfTsA/dcpQwZswxW+saweHcg5LUVRlrViVl4v84ryq0//bh8wFMtpwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2494
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDQtMjEgMjE6NDYsIEJlcm5hcmQgWmhhbyB3cm90ZToKPiBNYWtlIHRoZSBjb2Rl
IGEgYml0IG1vcmUgcmVhZGFibGUgYnkgdXNpbmcgYSBjb21tb24KPiBlcnJvciBoYW5kbGluZyBw
YXR0ZXJuLgo+IFdpdGggdGhhdCBkb25lIHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPgoKVGhhbmtzLiBUaGUgcGF0Y2ggaXMK
ClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KCkkg
cmVtb3ZlZCB0aGUgaGlzdG9yeSBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSwgbWFkZSBDaHJpc3Rp
YW4ncyAKUmV2aWV3ZWQtYnkgb2ZmaWNpYWwgYW5kIGFwcGxpZWQgdGhlIHBhdGNoLgoKUmVnYXJk
cywKIMKgIEZlbGl4Cgo+Cj4gQ2hhbmdlcyBzaW5jZSBWMToKPiAqY29tbWl0IG1lc3NhZ2UgaW1w
cm92ZQo+ICpjb2RlIHN0eWxlIHJlZmFjdG9yaW5nCj4KPiBDaGFuZ2VzIHNpbmNlIFYyOgo+ICpj
b2RlIHN0eWxlIGFkanVzdAo+Cj4gQ2hhbmdlcyBzaW5jZSBWMzoKPiAqZmluZCB0aGUgYmVzdCB3
YXkgdG8gbWVyZ2UgdW5uZWNlc3NhcnkgaWYvZWxzZSBjaGVjayBicmFuY2gKPgo+IENoYW5nZXMg
c2luY2UgVjQ6Cj4gKkltcHJvdmUgdGhlIHN1YmplY3QgbGluZSBhbmQgY29tbWl0IG1lc3NhZ2UK
Pgo+IExpbmsgZm9yIFYxOgo+ICpodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZwYXRjaHdvcmsl
MkZwYXRjaCUyRjEyMjY1ODclMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q0ZlbGl4Lkt1ZWhsaW5nJTQw
YW1kLmNvbSU3QzI3NTA5YWEwNDU1MDQyYmVlZGM3MDhkN2U2NWVmYzIyJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzIzMTE2Nzk1MTg2MjExOCZhbXA7c2Rh
dGE9SlBDeHNEeWN3MEp2WmZ5bTFha1Y3ZCUyQjRvUHp2elEwNFpsMXJ2M1dOJTJGajAlM0QmYW1w
O3Jlc2VydmVkPTAKPiAtLS0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jICB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IGluZGV4IDlkZmY3OTJjOTI5MC4u
YWNiNjEyYzUzYjljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IEBAIC02NjAsMTUgKzY2MCwxNSBAQCBzdGF0aWMgaW50IHJl
c2VydmVfYm9fYW5kX3ZtKHN0cnVjdCBrZ2RfbWVtICptZW0sCj4gICAKPiAgIAlyZXQgPSB0dG1f
ZXVfcmVzZXJ2ZV9idWZmZXJzKCZjdHgtPnRpY2tldCwgJmN0eC0+bGlzdCwKPiAgIAkJCQkgICAg
IGZhbHNlLCAmY3R4LT5kdXBsaWNhdGVzKTsKPiAtCWlmICghcmV0KQo+IC0JCWN0eC0+cmVzZXJ2
ZWQgPSB0cnVlOwo+IC0JZWxzZSB7Cj4gLQkJcHJfZXJyKCJGYWlsZWQgdG8gcmVzZXJ2ZSBidWZm
ZXJzIGluIHR0bVxuIik7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVz
ZXJ2ZSBidWZmZXJzIGluIHR0bS5cbiIpOwo+ICAgCQlrZnJlZShjdHgtPnZtX3BkKTsKPiAgIAkJ
Y3R4LT52bV9wZCA9IE5VTEw7Cj4gKwkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gICAKPiAtCXJldHVy
biByZXQ7Cj4gKwljdHgtPnJlc2VydmVkID0gdHJ1ZTsKPiArCXJldHVybiAwOwo+ICAgfQo+ICAg
Cj4gICAvKioKPiBAQCAtNzMzLDE3ICs3MzMsMTUgQEAgc3RhdGljIGludCByZXNlcnZlX2JvX2Fu
ZF9jb25kX3ZtcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLAo+ICAgCj4gICAJcmV0ID0gdHRtX2V1X3Jl
c2VydmVfYnVmZmVycygmY3R4LT50aWNrZXQsICZjdHgtPmxpc3QsCj4gICAJCQkJICAgICBmYWxz
ZSwgJmN0eC0+ZHVwbGljYXRlcyk7Cj4gLQlpZiAoIXJldCkKPiAtCQljdHgtPnJlc2VydmVkID0g
dHJ1ZTsKPiAtCWVsc2UKPiAtCQlwcl9lcnIoIkZhaWxlZCB0byByZXNlcnZlIGJ1ZmZlcnMgaW4g
dHRtLlxuIik7Cj4gLQo+ICAgCWlmIChyZXQpIHsKPiArCQlwcl9lcnIoIkZhaWxlZCB0byByZXNl
cnZlIGJ1ZmZlcnMgaW4gdHRtLlxuIik7Cj4gICAJCWtmcmVlKGN0eC0+dm1fcGQpOwo+ICAgCQlj
dHgtPnZtX3BkID0gTlVMTDsKPiArCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IC0JcmV0dXJu
IHJldDsKPiArCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+ICsJcmV0dXJuIDA7Cj4gICB9Cj4gICAK
PiAgIC8qKgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
