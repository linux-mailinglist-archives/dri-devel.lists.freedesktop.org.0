Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D8611930
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0C910E095;
	Fri, 28 Oct 2022 17:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544510E02B;
 Fri, 28 Oct 2022 17:21:54 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SHBUJB028682;
 Fri, 28 Oct 2022 17:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qLltRvyXMjPMB21CJFfuAifCdtkEX2I8wDAyDatYTXo=;
 b=suZCVh4BXT9FXmkes2YnDUVkigMXdJ4J40USZASOjHEcX40/ErlQ6ysSZ1HgpLgJ2Pib
 DmBnlHIk30BMDLqVLAKtzdvTTG9F+7R0ZkeDiO7GHB97Kx9SHnvozu5uPWVbgJbJTGM8
 aLNoS3b0bWS+2Zmd8QDFZGDAzCPl0vrtm1gfWu5YKo81wXjqAvBkM/dHfFyiaAthzmPB
 ysusr4m1S0gmVbL4GsUEhjaEwBfhzS3qBXovZ+AOxS6j9JhHRdRVt7IBz7uGzttzGdUK
 kmlTN13526ReCh8cmSlNQxMO8qnIa/2WRZP4ND3rjLwRiaw/VPJoFRETQCbbDgFfk5kh aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgk8x8c18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 17:21:26 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SHBUBb028709;
 Fri, 28 Oct 2022 17:21:25 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgk8x8c0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 17:21:25 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SHKSib021295;
 Fri, 28 Oct 2022 17:21:24 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3kfahggutv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 17:21:24 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SHLOL039190972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 17:21:24 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CACD5805D;
 Fri, 28 Oct 2022 17:21:22 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B863E58056;
 Fri, 28 Oct 2022 17:21:19 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.65.225.56]) by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 17:21:19 +0000 (GMT)
Message-ID: <592955555e1f9aac97db546236bdf2c2ab6cb229.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/7] vfio/ccw: create a parent struct
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Yi Liu
 <yi.l.liu@intel.com>
Date: Fri, 28 Oct 2022 13:21:19 -0400
In-Reply-To: <471d1f18-13b5-8e80-32aa-1598bca5bf2e@linux.ibm.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-2-farman@linux.ibm.com>
 <471d1f18-13b5-8e80-32aa-1598bca5bf2e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hPYZv7XdAb-yDW-fDFnaLekYezoQcAOO
X-Proofpoint-GUID: ag_lo8qY8OeK28pynowRYnndvcG-nJYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=931
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280107
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTEwLTI4IGF0IDEyOjUxIC0wNDAwLCBNYXR0aGV3IFJvc2F0byB3cm90ZToK
PiBPbiAxMC8xOS8yMiAxMjoyMSBQTSwgRXJpYyBGYXJtYW4gd3JvdGU6Cj4gPiBNb3ZlIHRoZSBz
dHVmZiBhc3NvY2lhdGVkIHdpdGggdGhlIG1kZXYgcGFyZW50IChhbmQgdGh1cyB0aGUKPiA+IHN1
YmNoYW5uZWwgc3RydWN0KSBpbnRvIGl0cyBvd24gc3RydWN0LCBhbmQgbGVhdmUgdGhlIHJlc3Qg
aW4KPiA+IHRoZSBleGlzdGluZyBwcml2YXRlIHN0cnVjdHVyZS4KPiA+IAo+ID4gVGhlIHN1YmNo
YW5uZWwgd2lsbCBwb2ludCB0byB0aGUgcGFyZW50LCBhbmQgdGhlIHBhcmVudCB3aWxsIHBvaW50
Cj4gPiB0byB0aGUgcHJpdmF0ZSwgZm9yIHRoZSBhcmVhcyB3aGVyZSBvbmUgb3IgYm90aCBhcmUg
bmVlZGVkLiBGdXJ0aGVyCj4gPiBzZXBhcmF0aW9uIG9mIHRoZXNlIHN0cnVjdHMgd2lsbCBmb2xs
b3cuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgRmFybWFuIDxmYXJtYW5AbGludXguaWJt
LmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X2Rydi5jwqDCoMKg
wqAgfCAxMDQgKysrKysrKysrKysrKysrKysrKystLS0tCj4gPiAtLS0tCj4gPiDCoGRyaXZlcnMv
czM5MC9jaW8vdmZpb19jY3dfb3BzLmPCoMKgwqDCoCB8wqDCoCA5ICsrLQo+ID4gwqBkcml2ZXJz
L3MzOTAvY2lvL3ZmaW9fY2N3X3BhcmVudC5owqAgfMKgIDI4ICsrKysrKysrCj4gPiDCoGRyaXZl
cnMvczM5MC9jaW8vdmZpb19jY3dfcHJpdmF0ZS5oIHzCoMKgIDUgLS0KPiA+IMKgNCBmaWxlcyBj
aGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCj4gPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X3BhcmVudC5oCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X2Rydi5jCj4gPiBiL2RyaXZlcnMv
czM5MC9jaW8vdmZpb19jY3dfZHJ2LmMKPiA+IGluZGV4IDdmNTQwMmZlODU3YS4uNjM0NzYwY2Ew
ZGVhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19kcnYuYwo+ID4g
KysrIGIvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19kcnYuYwo+ID4gQEAgLTIwLDYgKzIwLDcg
QEAKPiA+IMKgI2luY2x1ZGUgImNocC5oIgo+ID4gwqAjaW5jbHVkZSAiaW9hc20uaCIKPiA+IMKg
I2luY2x1ZGUgImNzcy5oIgo+ID4gKyNpbmNsdWRlICJ2ZmlvX2Njd19wYXJlbnQuaCIKPiA+IMKg
I2luY2x1ZGUgInZmaW9fY2N3X3ByaXZhdGUuaCIKPiA+IMKgCj4gPiDCoHN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICp2ZmlvX2Njd193b3JrX3E7Cj4gPiBAQCAtMzYsNyArMzcsOCBAQCBkZWJ1Z19p
bmZvX3QgKnZmaW9fY2N3X2RlYnVnX3RyYWNlX2lkOwo+ID4gwqAgKi8KPiA+IMKgaW50IHZmaW9f
Y2N3X3NjaF9xdWllc2NlKHN0cnVjdCBzdWJjaGFubmVsICpzY2gpCj4gPiDCoHsKPiA+IC3CoMKg
wqDCoMKgwqDCoHN0cnVjdCB2ZmlvX2Njd19wcml2YXRlICpwcml2YXRlID0gZGV2X2dldF9kcnZk
YXRhKCZzY2gtCj4gPiA+ZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB2ZmlvX2Njd19w
YXJlbnQgKnBhcmVudCA9IGRldl9nZXRfZHJ2ZGF0YSgmc2NoLQo+ID4gPmRldik7Cj4gPiArwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgdmZpb19jY3dfcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldl9nZXRfZHJ2
ZGF0YSgmcGFyZW50LQo+ID4gPmRldik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgREVDTEFSRV9DT01Q
TEVUSU9OX09OU1RBQ0soY29tcGxldGlvbik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IGlyZXRy
eSwgcmV0ID0gMDsKPiA+IMKgCj4gPiBAQCAtNTEsMTkgKzUzLDIxIEBAIGludCB2ZmlvX2Njd19z
Y2hfcXVpZXNjZShzdHJ1Y3Qgc3ViY2hhbm5lbAo+ID4gKnNjaCkKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogRmx1c2ggYWxs
IEkvTyBhbmQgd2FpdCBmb3IKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBj
YW5jZWwvaGFsdC9jbGVhciBjb21wbGV0aW9uLgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaXZhdGUtPmNv
bXBsZXRpb24gPSAmY29tcGxldGlvbjsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzcGluX3VubG9ja19pcnEoc2NoLT5sb2NrKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAocHJpdmF0ZSkgewo+IAo+IElzIGl0IHZhbGlkIHRvIGV2ZXIgcmVhY2ggdGhp
cyBjb2RlIHdpdGggcHJpdmF0ZSA9PSBOVUxMP8KgIElmIG5vLAo+IHRoZW4gdGhpcyBzaG91bGQg
cHJvYmFibHkgYmUgYSBXQVJOX09OIHVwZnJvbnQ/CgpIcm0sIHRoZSBjYWxsZXIganVtcHMgZnJv
bSBwcml2YXRlIC0+IHN1YmNoYW5uZWwsIHNvIGl0IHdvdWxkIGJlIHdlaXJkCmlmIHdlIGNvdWxk
bid0IHRoZW4gZ28gYmFjayB0aGUgb3RoZXIgd2F5LiBQcm9iYWJseSBpbXBvc3NpYmxlLCBJJ2xs
CnVud2luZCB0aGVzZSB3aGl0ZXNwYWNlIGNoYW5nZXMgYW5kIHB1dCB0aGUgV0FSTl9PTiBvbiB0
b3AuIFRoYW5rcyBmb3IKdGhlIHRpcC4KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIEZsdXNoIGFsbCBJL08gYW5kIHdhaXQgZm9yCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGNhbmNlbC9oYWx0
L2NsZWFyIGNvbXBsZXRpb24uCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBwcml2YXRlLT5jb21wbGV0aW9uID0gJmNvbXBsZXRpb247Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycShz
Y2gtPmxvY2spOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
cmV0ID09IC1FQlVTWSkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZjb21wbGV0aW9uLAo+ID4gMypI
Wik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChyZXQgPT0gLUVCVVNZKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZj
b21wbGUKPiA+IHRpb24sIDMqSFopOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBwcml2YXRlLT5jb21wbGV0aW9uID0gTlVMTDsKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBmbHVzaF93b3JrcXVldWUodmZpb19jY3dfd29ya19xKTsKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKHNjaC0+bG9jayk7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaXZhdGUtPmNv
bXBsZXRpb24gPSBOVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBmbHVzaF93b3JrcXVldWUodmZpb19jY3dfd29ya19xKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycShzY2gt
PmxvY2spOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gY2lvX2Rpc2FibGVfc3ViY2hhbm5lbChzY2gp
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoH0gd2hpbGUgKHJldCA9PSAtRUJVU1kpOwo+ID4gwqAKPiAK
PiAuLiBzbmlwIC4uCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Nj
d19wYXJlbnQuaAo+ID4gYi9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X3BhcmVudC5oCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44MzRjMDAwNzc4MDIK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfcGFy
ZW50LmgKPiA+IEBAIC0wLDAgKzEsMjggQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogTURFViBQYXJlbnQgY29udGVudHMgZm9yIHZm
aW9fY2N3IGRyaXZlcgo+ID4gKyAqCj4gPiArICogQ29weXJpZ2h0IElCTSBDb3JwLiAyMDIyCj4g
PiArICovCj4gPiArCj4gPiArI2lmbmRlZiBfVkZJT19DQ1dfUEFSRU5UX0hfCj4gPiArI2RlZmlu
ZSBfVkZJT19DQ1dfUEFSRU5UX0hfCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4K
PiA+ICsKPiA+ICsvKioKPiA+ICsgKiBzdHJ1Y3QgdmZpb19jY3dfcGFyZW50Cj4gPiArICoKPiA+
ICsgKiBAZGV2OiBlbWJlZGRlZCBkZXZpY2Ugc3RydWN0Cj4gPiArICogQHBhcmVudDogcGFyZW50
IGRhdGEgc3RydWN0dXJlcyBmb3IgbWRldnMgY3JlYXRlZAo+ID4gKyAqIEBtZGV2X3R5cGUocyk6
IGlkZW50aWZ5aW5nIGluZm9ybWF0aW9uIGZvciBtZGV2cyBjcmVhdGVkCj4gPiArICovCj4gPiAr
c3RydWN0IHZmaW9fY2N3X3BhcmVudCB7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBtZGV2X3BhcmVudMKgwqDCoMKgwqDCoHBhcmVudDsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBtZGV2X3R5cGXCoMKgwqDCoMKgwqDCoMKgbWRldl90eXBlOwo+ID4gK8KgwqDCoMKgwqDCoMKg
c3RydWN0IG1kZXZfdHlwZcKgwqDCoMKgwqDCoMKgwqAqbWRldl90eXBlc1sxXTsKPiA+ICt9Owo+
IAo+IFN0cnVjdHVyZSBpdHNlbGYgc2VlbXMgZmluZSwgYnV0IGFueSByZWFzb24gd2UgbmVlZCBh
IG5ldyBmaWxlIGZvcgo+IGl0Pwo+IAoKTm90IHJlYWxseS4gSSBjb3VsZCBsZWF2ZSBpdCBpbiBf
cHJpdmF0ZS5oLCBidXQgdGhhdCBmaWxlIGlzIGp1c3QgYQpkdW1waW5nIGdyb3VuZCBmb3IgZXZl
cnl0aGluZyBzbyBJIHRob3VnaHQgdGhpcyB3b3VsZCBiZSBhIGdvb2QKb3Bwb3J0dW5pdHkgdG8g
c3RhcnQgdG8gY2xlYW5pbmcgdGhhdCB1cC4gQnV0IGl0IHdvdWxkbid0IGJvdGhlciBtZSB0bwps
ZWF2ZSB0aGF0IHdob2xlIHByb2Nlc3MgdG8gYW5vdGhlciBkYXkgdG9vLgo=

