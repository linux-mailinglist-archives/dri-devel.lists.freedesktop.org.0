Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E91275A39
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7BF6E9B7;
	Wed, 23 Sep 2020 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F66E9B7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRnGuzqMmHHFjThbwBGXtlvsX1r4Cb6DysYXoV2zIBzlzzHqhGKc3Wwpi8Taf1WeFQ3w/8LNDtbo7bwJY65SWFy9il2TgNqtJN8nz3sf5zPcREeyIos1ZXdKHHmRsrN/hYXzxH+uFFgEWVDOkJfG1hRkPIlQB/ZYZZ/S1b9LhPTgq3x/DXtUNLxrJHWKIH8FmAITqA8IWVGV11ouXOM0i2IkO9VAsmbBY8zfoEzWK8SJrdapg0y3AK3yx6zy3NFvFVPvPtVBosz7qGr5RiC/VN8SR3GtLw4yGtrovZctLNBRfuwh+beyFzbrZROA5PO76/eJdhm61hKJObaN0JQ+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEuKOQYP5KyDenYfvXK9xIKac8R4LgJxKYwAQQ+LfXk=;
 b=cO7oJqxlucjBkYbNqKSOS17NNEnFPH1wTHJMEuzHvjqYWAgLsM/HIEWX1o/Dz2aBNSUXjlYhYnQWb16j1HjP5iG5BynARrhFx8KmeuxwzrbO2ODS8c8XrvkJcUlvvr8E56q8OlezZr70hspMdL2GoEvi2z7nhEGr3zVQ07xt73+LWAV6b4sxuu5AHZmOUMaELtMJL510EJ3LC769a1ykpdwZAf1JwvtAkoE+Gk/oEp3in7pQ2zlougLrpmUKn8H0J/+wZnlz9H76QeAIVes2vDXxB37HvNR6TeGoloVuukBZ7GO/ebqT/C2WcpqLtvvLTOHfAfDQ0MnYMbj1eSct1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEuKOQYP5KyDenYfvXK9xIKac8R4LgJxKYwAQQ+LfXk=;
 b=HeKXO2yq5XBPgyQ0fTXpyN0F9D72bP66tQ7ikfzuHGB9CPc+izHPy5uEdKEaCkuErK9/hM9QRyHy7Tqf1biprhEQVjEnL4Vpk+/9a8wnC0+0YccJT+x3eosWr+mGLVCQ2RtzuMdaVParCooChFmMgyP6w29BG/gcptD4ZeNos7g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:35:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:35:26 +0000
Subject: Re: [PATCH 02/10] drm/qxl: kill unused bo wait wrapper
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <188df728-6c8a-1d91-2b80-f1a3388e11be@amd.com>
Date: Wed, 23 Sep 2020 16:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:208:ac::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.4 via Frontend Transport; Wed, 23 Sep 2020 14:35:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 934c1c3e-007e-4605-6124-08d85fcde98c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549E7349539337C3264250383380@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssmAxVFDXSxv2TVmw6p24qyUDf0wg+UOz4mGQuS/2XRnoeh1QCVcM0mKYMYlCms+5K/jYkiXuQ/ohiSYvag5Dm9cxtRg6O0AXgRhCtk01p1KXqhEV9YqJifiDmP5Hn4t1AG637WBVtdYK7YFncpNBhU/JiOSYNcV1/iUnnjVvN19nKoclLP0KkXQGWPYlrPXcFyVTaKF4qzke6bN2TKwcOp24eLg0EhH5V+66LMixRePArnKf1sP+P/1xO7FTsRkv62dd/TzO/4AA2igvcF9P0vdNfOFwW83qw7UPzJUbHydaNwfah2RP0FlXEJ058DHYib/huCQNqiyzT4ekguUX2XUzJGHyz8tZ4wacsR4eihTZ9Q9AQvmbtRpcbe5szvZec4HTk5R/OkUFruSrOe9oZFBeyCNw8+ysanJ0mdaqglYLTszTugGWOjYe2ZQ1rCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(8936002)(52116002)(66476007)(316002)(66556008)(66946007)(4326008)(8676002)(478600001)(6666004)(6486002)(16526019)(2616005)(186003)(36756003)(2906002)(31686004)(5660300002)(86362001)(83380400001)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pxLy1w9wW3Ac3xtAgcAAebPNBScwhWFZ0hsM8wp/IPZWbzTeWriGcK/zxiySEkJd8hDhGcuopKGt13C4H1ujHC/5jCefH395n7ukEVGfq2N2PRFZXoq6QFFnfDY26/1Z3krkG+Ts0cFrNRYTN0QjVjWh0VTKIqGuXczpUX1k6lSXc1KQaAuy8tE9SJ9n67pSbWpmNIneUzjVkwesMKkl7g9Mkhit1+pPU+01rFwwDZNPYYtRUBbOarzQcJzeCdBxuX4yymOoxV3iETQZWWKRQt7VSlutd3h2ghGpE4f8ToaF74tIueCveLqkaBgqepZT3Kbbj1v2nZbwJIWJFZXgddVWwI3L3BXPxcBzwXkfLqWJJHggcn6YPMjNTvWZ06XrbgQK0+dwQiUc2mn0T7LPGh70JjDnAhAh+iDroQWmgpd06vcSwprK6SmInS5RHwmFTXq6e6f8tORWoML3d9EyDY31ViWx++9+fbuYslTFblpP4OfBXLmkzsKGbETNCs7FHzJYKbYp912NxLaO28V2go8zQNoDYexCD/rmH8msXrFWlnGgl/Vjxh3uNSB1tGdaG/BHNznVTi6oxExwqqTbVBXKmD14BOwVXVzxPLQs/rvfsEPlaMl3s2mlYTv8l2rSk+etBiJDcA04WFVLjhfcb1/Rsr6TF70vVsQswGqOvOoeq6BTVClNeh3mTHa06umYhk49CcOslDBVitSkvFuY6w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934c1c3e-007e-4605-6124-08d85fcde98c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:35:26.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv0TRN8R1wKzca2BxhPFQEnO8QFr0Xy7TTvKjU0+Rz5m51pZcS8KjECzPNT7fCoS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDkuMjAgdW0gMDU6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3YXNuJ3QgdXNlZCBhbnl3aGVlcmUK
Pgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpBY2tl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oIHwgMjMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX29iamVjdC5oCj4gaW5kZXggYzdkNzliMjA2MjJlLi4wOWE1YzgxODMyNGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmgKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuaAo+IEBAIC01OCwyOSArNTgsNiBAQCBzdGF0aWMgaW5s
aW5lIHU2NCBxeGxfYm9fbW1hcF9vZmZzZXQoc3RydWN0IHF4bF9ibyAqYm8pCj4gICAJcmV0dXJu
IGRybV92bWFfbm9kZV9vZmZzZXRfYWRkcigmYm8tPnRiby5iYXNlLnZtYV9ub2RlKTsKPiAgIH0K
PiAgIAo+IC1zdGF0aWMgaW5saW5lIGludCBxeGxfYm9fd2FpdChzdHJ1Y3QgcXhsX2JvICpibywg
dTMyICptZW1fdHlwZSwKPiAtCQkJICAgICAgYm9vbCBub193YWl0KQo+IC17Cj4gLQlpbnQgcjsK
PiAtCj4gLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQsIE5VTEwp
Owo+IC0JaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKPiAtCQlpZiAociAhPSAtRVJFU1RBUlRTWVMp
IHsKPiAtCQkJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBiby0+dGJvLmJhc2UuZGV2Owo+IC0K
PiAtCQkJZGV2X2VycihkZGV2LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZCBmb3Igd2FpdFxuIiwK
PiAtCQkJCWJvKTsKPiAtCQl9Cj4gLQkJcmV0dXJuIHI7Cj4gLQl9Cj4gLQlpZiAobWVtX3R5cGUp
Cj4gLQkJKm1lbV90eXBlID0gYm8tPnRiby5tZW0ubWVtX3R5cGU7Cj4gLQo+IC0JciA9IHR0bV9i
b193YWl0KCZiby0+dGJvLCB0cnVlLCBub193YWl0KTsKPiAtCXR0bV9ib191bnJlc2VydmUoJmJv
LT50Ym8pOwo+IC0JcmV0dXJuIHI7Cj4gLX0KPiAtCj4gICBleHRlcm4gaW50IHF4bF9ib19jcmVh
dGUoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCj4gICAJCQkgdW5zaWduZWQgbG9uZyBzaXplLAo+
ICAgCQkJIGJvb2wga2VybmVsLCBib29sIHBpbm5lZCwgdTMyIGRvbWFpbiwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
