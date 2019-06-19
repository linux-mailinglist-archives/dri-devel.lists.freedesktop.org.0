Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8D4B51D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3E16E33D;
	Wed, 19 Jun 2019 09:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0626E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:42:01 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9cQxE178598;
 Wed, 19 Jun 2019 09:42:00 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t7809abxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:42:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9fDdK165167;
 Wed, 19 Jun 2019 09:41:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t77yn82p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:41:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J9fwSc012813;
 Wed, 19 Jun 2019 09:41:58 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 02:41:57 -0700
Date: Wed, 19 Jun 2019 12:41:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: seanpaul@chromium.org
Subject: Re: [bug report] drm: Add helpers to kick off self refresh mode in
 drivers
Message-ID: <20190619094151.GI18776@kadam>
References: <20190619093937.GA25140@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619093937.GA25140@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=WZ1Cg5rFQVT4IgbdlfGoCBYZbHBOe6sSezgCdLEIrrM=;
 b=4g0I61UUhkBh6wDxoknO/jfYl6RLjaBs5+1UdVYJL4nYY5JQ/oWZKX5pXgSvgvOkGNx0
 hGVG/Yk+LsXN6QZxVyn1o6frMdeLa/KfkDk6+roIwhcaNXr2eV5U9guKvEIquee6DJTe
 y/xiKRC6uEcFrFr2xOi1wBDHkduZ2xdVXdxLiPK23uqxV/l34rsLVWrwhiwAEmjWzMlu
 dNwu5yq/4m9ZlNmiLH+AyIDYd6hrtI2PTKyIL6yDjBst87n44b5PpZem4jmivD/wz7K9
 Cf0m4ABK/5G0qGUHwQoHH58AB6uwJXAxjmdpvzExX6fUIbs+joXGtqdV2ypQqzt99fh4 7w== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6Mzk6MzdQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiAgICAgNzIgICAgICAgICAgaW50IGksIHJldDsKPiAgICAgNzMgIAo+ICAgICA3NCAg
ICAgICAgICBkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwgMCk7Cj4gICAgIDc1ICAKPiAg
ICAgNzYgICAgICAgICAgc3RhdGUgPSBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKGRldik7Cj4gICAg
IDc3ICAgICAgICAgIGlmICghc3RhdGUpIHsKPiAgICAgNzggICAgICAgICAgICAgICAgICByZXQg
PSAtRU5PTUVNOwo+ICAgICA3OSAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eXl5eCj4gVGhlIGFsbG9jYXRpb24gZmFpbGVkLgo+IAo+ICAg
ICA4MCAgICAgICAgICB9Cj4gICAgIDgxICAKPiAgICAgODIgIHJldHJ5Ogo+ICAgICA4MyAgICAg
ICAgICBzdGF0ZS0+YWNxdWlyZV9jdHggPSAmY3R4Owo+ICAgICA4NCAgCj4gICAgIDg1ICAgICAg
ICAgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsK
PiAgICAgODYgICAgICAgICAgaWYgKElTX0VSUihjcnRjX3N0YXRlKSkgewo+ICAgICA4NyAgICAg
ICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoY3J0Y19zdGF0ZSk7Cj4gICAgIDg4ICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4gICAgIDg5ICAgICAgICAgIH0KPiAgICAgOTAgIAo+ICAgICA5
MSAgICAgICAgICBpZiAoIWNydGNfc3RhdGUtPmVuYWJsZSkKPiAgICAgOTIgICAgICAgICAgICAg
ICAgICBnb3RvIG91dDsKCk9oLi4uICBBbHNvIHdlIG5lZWQgdG8gc2V0ICJyZXQiIGhlcmUuCgo+
ICAgICA5MyAgCj4gICAgIDk0ICAgICAgICAgIHJldCA9IGRybV9hdG9taWNfYWRkX2FmZmVjdGVk
X2Nvbm5lY3RvcnMoc3RhdGUsIGNydGMpOwo+ICAgICA5NSAgICAgICAgICBpZiAocmV0KQo+ICAg
ICA5NiAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICA5NyAgCj4gICAgIDk4ICAgICAg
ICAgIGZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoc3RhdGUsIGNvbm4sIGNvbm5fc3Rh
dGUsIGkpIHsKPiAgICAgOTkgICAgICAgICAgICAgICAgICBpZiAoIWNvbm5fc3RhdGUtPnNlbGZf
cmVmcmVzaF9hd2FyZSkKPiAgICAxMDAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ICAgIDEwMSAgICAgICAgICB9Cj4gICAgMTAyICAKPiAgICAxMDMgICAgICAgICAgY3J0Y19z
dGF0ZS0+YWN0aXZlID0gZmFsc2U7Cj4gICAgMTA0ICAgICAgICAgIGNydGNfc3RhdGUtPnNlbGZf
cmVmcmVzaF9hY3RpdmUgPSB0cnVlOwo+ICAgIDEwNSAgCj4gICAgMTA2ICAgICAgICAgIHJldCA9
IGRybV9hdG9taWNfY29tbWl0KHN0YXRlKTsKPiAgICAxMDcgICAgICAgICAgaWYgKHJldCkKPiAg
ICAxMDggICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgICAxMDkgIAo+ICAgIDExMCAgb3V0
Ogo+ICAgIDExMSAgICAgICAgICBpZiAocmV0ID09IC1FREVBRExLKSB7Cj4gICAgMTEyICAgICAg
ICAgICAgICAgICAgZHJtX2F0b21pY19zdGF0ZV9jbGVhcihzdGF0ZSk7Cj4gICAgMTEzICAgICAg
ICAgICAgICAgICAgcmV0ID0gZHJtX21vZGVzZXRfYmFja29mZigmY3R4KTsKPiAgICAxMTQgICAg
ICAgICAgICAgICAgICBpZiAoIXJldCkKPiAgICAxMTUgICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gcmV0cnk7Cj4gICAgMTE2ICAgICAgICAgIH0KPiAgICAxMTcgIAo+ICAgIDExOCAgICAg
ICAgICBkcm1fYXRvbWljX3N0YXRlX3B1dChzdGF0ZSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eCj4gTlVMTCBkZXJlZmVyZW5jZS4KPiAKPiAgICAxMTkgICAg
ICAgICAgZHJtX21vZGVzZXRfZHJvcF9sb2NrcygmY3R4KTsKPiAgICAxMjAgICAgICAgICAgZHJt
X21vZGVzZXRfYWNxdWlyZV9maW5pKCZjdHgpOwo+ICAgIDEyMSAgfQoKcmVnYXJkcywKZGFuIGNh
cnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
