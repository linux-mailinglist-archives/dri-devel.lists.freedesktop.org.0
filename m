Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954BCE35B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 15:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6F89D9A;
	Mon,  7 Oct 2019 13:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBF589D00
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 13:25:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97DJEMn044722;
 Mon, 7 Oct 2019 13:25:18 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vejku6py0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 13:25:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97DHrbC037339;
 Mon, 7 Oct 2019 13:25:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2vg203rtxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 13:25:17 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x97DPEfm017826;
 Mon, 7 Oct 2019 13:25:15 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Oct 2019 13:25:13 +0000
Date: Mon, 7 Oct 2019 16:25:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer
 disable_done
Message-ID: <20191007132505.GV22609@kadam>
References: <20191004162156.325-1-colin.king@canonical.com>
 <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
 <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=919
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=CjAq2/qIQ+hwx+J1512MljThH+9wP2hyv7uTXzQ8/ps=;
 b=i3/yK5MrK0JFZNPBX5l974i3IlH9H9BBtbIxX5oWOGo7JVoBVKie72fW7IbWelYwRt6j
 RFduqLV/h/rz+GHDxJOEJyeabgG/AedoHFMxJGzhOue6tOy6RXX2Q3Qtap2UYBu2w6xE
 +gfkdijAx0K+maHOinBb/NAE3Ty6D2wuVPHIQpSuHR4DkH2GghY0faiMGh1buH/R60Ct
 CzP8rWKI1e8CXNshnVvDJj7YvTJzFUyCYL0pvirXXfC5FnScU4dThRIs6bYY0Wn0JFd7
 iPKHHQyxQpVE7L6CFiEyWK7nHhDp+pkwwNmlXOZQAY6dU5JZonIPM6Jih+T1frb6I+Xh FA== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMTA6NTM6NDRQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gT24gMDQvMTAvMjAxOSAyMDoyNywgTGl2aXUgRHVkYXUgd3JvdGU6Cj4gPiBPbiBG
cmksIE9jdCAwNCwgMjAxOSBhdCAwNToyMTo1NlBNICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOgo+
ID4+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPj4K
PiA+PiBUaGUgcG9pbnRlciBkaXNhYmxlX2RvbmUgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgd2l0aCBh
IHZhbHVlIHRoYXQKPiA+PiBpcyBuZXZlciByZWFkIGFuZCBpcyBiZWluZyByZS1hc3NpZ25lZCBh
IGxpdHRsZSBsYXRlciBvbi4gVGhlCj4gPj4gYXNzaWdubWVudCBpcyByZWR1bmRhbnQgYW5kIGhl
bmNlIGNhbiBiZSByZW1vdmVkLgo+ID4gCj4gPiBOb3QgcmVhbGx5IHRydWUsIGlzbid0IGl0PyBU
aGUgcmUtYXNzaWdubWVudCBpcyBkb25lIHVuZGVyIHRoZSBjb25kaXRpb24gdGhhdAo+ID4gY3J0
Yy0+c3RhdGUtPmFjdGl2ZSBpcyB0cnVlLiBkaXNhYmxlX2RvbmUgd2lsbCBiZSB1c2VkIHJlZ2Fy
ZGxlc3MgYWZ0ZXIgdGhlIGlmCj4gPiBibG9jaywgc28gd2UgY2FuJ3Qgc2tpcCB0aGlzIGluaXRp
YWxpc2F0aW9uLgo+ID4gCj4gPiBOb3Qgc3VyZSB3aHkgQ292ZXJpdHkgZmxhZ3MgdGhpcywgYnV0
IEkgd291bGQgTkFLIHRoaXMgcGF0Y2guCj4gCj4gSSdtIHBhdGNoaW5nIGFnYWluc3QgdGhlIGRy
aXZlciBmcm9tIGxpbnV4LW5leHQgc28gSSBiZWxpZXZlIHRoaXMgaXMgT0sKPiBmb3IgdGhhdC4g
SSBiZWxpZXZlIHlvdXIgc3RhdGVtZW50IGlzIHRydWUgYWdhaW5zdCBsaW51eCB3aGljaCBkb2Vz
IG5vdAo+IGhhdmUgY29tbWl0Ogo+IAo+IGQ2Y2IwMTM1NzllNzQzYmM3YmM1NTkwY2EzNWExOTQz
ZjJiOGYzYzgKPiBBdXRob3I6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPExvd3J5
LkxpQGFybS5jb20+Cj4gRGF0ZTogICBGcmkgU2VwIDYgMDc6MTg6MDYgMjAxOSArMDAwMAo+IAoK
SXQgcmVhbGx5IGRvZXMgaGVscCByZXZpZXdpbmcgcGF0Y2hlcyB3aGVuIHRoaXMgaXMgbWVudGlv
bmVkIGluIHRoZQpjb21taXQgbWVzc2FnZS4KClRoZXJlIGlzIHNvbWUgZGViYXRlIGFib3V0IHdo
ZXRoZXIgdGhpcyBzaG91bGQgYmUgbWVudGlvbmVkIGFzIGEgRml4ZXMKc2luY2UgaXQgZG9lc24n
dCBmaXggYSBidWcuICBJIGluaXRpYWx5IGZlbHQgaXQgc2hvdWxkbid0IGJlLCBidXQgbm93Ckkg
dGhpbmsgZW5vdWdoIHBlb3BsZSB0aGluayBpdCBzaG91bGQgYmUgbGlzdGVkIGFzIEZpeGVzIHRo
YXQgSSBtdXN0IGJlCndyb25nLiAgRWl0aGVyIHdheSwgaXQncyB2ZXJ5IHVzZWZ1bCBpbmZvcm1h
dGlvbi4KClRoZSBvdGhlciB0aGluZyBpcyB0aGF0IHNvb24gZ2V0X21haW50YWluZXIucGwgd2ls
bCBzdGFydCBDQydpbmcgcGVvcGxlCmZyb20gdGhlIEZpeGVzIHRhZyBhbmQgcmlnaHQgbm93IExv
d3J5IExpIGlzIG5vdCBDQydkIHNvIHRoYXQncwp1bmZvcnR1bmF0ZS4KCnJlZ2FyZHMsCmRhbiBj
YXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
