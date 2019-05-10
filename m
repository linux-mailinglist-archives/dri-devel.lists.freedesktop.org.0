Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086B19B10
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF978930E;
	Fri, 10 May 2019 10:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0C98930E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 10:11:58 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AA3moe102341;
 Fri, 10 May 2019 10:11:51 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2s94bgg436-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 10:11:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AABRIN052174;
 Fri, 10 May 2019 10:11:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2s94aha0fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 10:11:50 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4AABmkC023767;
 Fri, 10 May 2019 10:11:49 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 May 2019 10:11:47 +0000
Date: Fri, 10 May 2019 13:11:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@01.org, Ramalingam C <ramalingam.c@intel.com>
Subject: [drm-intel:drm-intel-next-queued 4/6] drivers/gpu/drm/drm_hdcp.c:190
 drm_hdcp_parse_hdcp2_srm() warn: mask and shift to zero
Message-ID: <20190510101141.GC16030@kadam>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905100072
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=g2ra8HKeMe8q8fNV0s+ssqsnOSTK7J2dbzJWpP8kDQA=;
 b=HJ3eFfO69NZ6P6axjDM2OK2POUv1SnU8TQuOzbWXKlMf/JL2Z8U1lSqTKFDkV9o37xLu
 iczL5p2/yqFztHGjnT2TN3qssBL0qGiA+G4kxfK02BdqtEgQYwPESeyIudS68jSRFSX0
 FBBXf2B4fV3woXM2TCxmPli0dZFJ2mWkzr/p+8VRnqBppat2BDF8qO+3gtve27q5OmcY
 7s+s/ieAcIxPiFm1St6MN7yXQYino/BphV5IHenEWkRTrkfkghys1PrD/Fr06G5fzI+v
 OYujenikiut2FobE169+5Z6RKFw/cSL/6bys1q8fiyLW/aN0D1jF+E2uGTU2+eM/sTV0 Iw== 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 kbuild-all@01.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50ZWwgZHJtLWludGVs
LW5leHQtcXVldWVkCmhlYWQ6ICAgYzE2ZmQ5YmU3MGZhZjNjNDlhNjE3MDBlZmQxNjAxOGRkOTEw
ZTM5MApjb21taXQ6IDY0OThiZjU4MDBhMzAyZWY2OWU3ZjQ5MTRlNzI3ODkzZjI3OGJiMmYgWzQv
Nl0gZHJtOiByZXZvY2F0aW9uIGNoZWNrIGF0IGRybSBzdWJzeXN0ZW0KCklmIHlvdSBmaXggdGhl
IGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgoKc21hdGNoIHdhcm5pbmdzOgpkcml2ZXJzL2dwdS9kcm0vZHJt
X2hkY3AuYzoxOTAgZHJtX2hkY3BfcGFyc2VfaGRjcDJfc3JtKCkgd2FybjogbWFzayBhbmQgc2hp
ZnQgdG8gemVybwoKZ2l0IHJlbW90ZSBhZGQgZHJtLWludGVsIGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2RybS1pbnRlbApnaXQgcmVtb3RlIHVwZGF0ZSBkcm0taW50ZWwKZ2l0IGNoZWNr
b3V0IDY0OThiZjU4MDBhMzAyZWY2OWU3ZjQ5MTRlNzI3ODkzZjI3OGJiMmYKdmltICsxOTAgZHJp
dmVycy9ncHUvZHJtL2RybV9oZGNwLmMKCjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3
ICAxNTEgIHN0YXRpYyBpbnQgZHJtX2hkY3BfcGFyc2VfaGRjcDJfc3JtKGNvbnN0IHU4ICpidWYs
IHNpemVfdCBjb3VudCkKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE1MiAgewo2
NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0wNyAgMTUzICAJc3RydWN0IGhkY3Bfc3JtX2hl
YWRlciAqaGVhZGVyOwo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0wNyAgMTU0ICAJdTMy
IHZybF9sZW5ndGgsIGtzdl9jb3VudCwga3N2X3N6Owo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAx
OS0wNS0wNyAgMTU1ICAKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE1NiAgCWlm
IChjb3VudCA8IChzaXplb2Yoc3RydWN0IGhkY3Bfc3JtX2hlYWRlcikgKwo2NDk4YmY1OCBSYW1h
bGluZ2FtIEMgMjAxOS0wNS0wNyAgMTU3ICAJICAgIERSTV9IRENQXzJfVlJMX0xFTkdUSF9TSVpF
ICsgRFJNX0hEQ1BfMl9EQ1BfU0lHX1NJWkUpKSB7CjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5
LTA1LTA3ICAxNTggIAkJRFJNX0VSUk9SKCJJbnZhbGlkIGJsb2IgbGVuZ3RoXG4iKTsKNjQ5OGJm
NTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE1OSAgCQlyZXR1cm4gLUVJTlZBTDsKNjQ5OGJm
NTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE2MCAgCX0KNjQ5OGJmNTggUmFtYWxpbmdhbSBD
IDIwMTktMDUtMDcgIDE2MSAgCjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxNjIg
IAloZWFkZXIgPSAoc3RydWN0IGhkY3Bfc3JtX2hlYWRlciAqKWJ1ZjsKNjQ5OGJmNTggUmFtYWxp
bmdhbSBDIDIwMTktMDUtMDcgIDE2MyAgCURSTV9ERUJVRygiU1JNIElEOiAweCV4LCBTUk0gVmVy
OiAweCV4LCBTUk0gR2VuIE5vOiAweCV4XG4iLAo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0w
NS0wNyAgMTY0ICAJCSAgaGVhZGVyLT5zcm1faWQgJiBEUk1fSERDUF9TUk1fSURfTUFTSywKNjQ5
OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE2NSAgCQkgIGJlMTZfdG9fY3B1KGhlYWRl
ci0+c3JtX3ZlcnNpb24pLCBoZWFkZXItPnNybV9nZW5fbm8pOwo2NDk4YmY1OCBSYW1hbGluZ2Ft
IEMgMjAxOS0wNS0wNyAgMTY2ICAKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE2
NyAgCWlmIChoZWFkZXItPnJlc2VydmVkKQo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0w
NyAgMTY4ICAJCXJldHVybiAtRUlOVkFMOwo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0w
NyAgMTY5ICAKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE3MCAgCWJ1ZiA9IGJ1
ZiArIHNpemVvZigqaGVhZGVyKTsKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE3
MSAgCXZybF9sZW5ndGggPSBnZXRfdnJsX2xlbmd0aChidWYpOwo2NDk4YmY1OCBSYW1hbGluZ2Ft
IEMgMjAxOS0wNS0wNyAgMTcyICAKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE3
MyAgCWlmIChjb3VudCA8IChzaXplb2Yoc3RydWN0IGhkY3Bfc3JtX2hlYWRlcikgKyB2cmxfbGVu
Z3RoKSB8fAo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0wNyAgMTc0ICAJICAgIHZybF9s
ZW5ndGggPCAoRFJNX0hEQ1BfMl9WUkxfTEVOR1RIX1NJWkUgKwo2NDk4YmY1OCBSYW1hbGluZ2Ft
IEMgMjAxOS0wNS0wNyAgMTc1ICAJICAgIERSTV9IRENQXzJfRENQX1NJR19TSVpFKSkgewo2NDk4
YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0wNyAgMTc2ICAJCURSTV9FUlJPUigiSW52YWxpZCBi
bG9iIGxlbmd0aCBvciB2cmwgbGVuZ3RoXG4iKTsKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTkt
MDUtMDcgIDE3NyAgCQlyZXR1cm4gLUVJTlZBTDsKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTkt
MDUtMDcgIDE3OCAgCX0KNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE3OSAgCjY0
OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODAgIAkvKiBMZW5ndGggb2YgdGhlIGFs
bCB2cmxzIGNvbWJpbmVkICovCjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODEg
IAl2cmxfbGVuZ3RoIC09IChEUk1fSERDUF8yX1ZSTF9MRU5HVEhfU0laRSArCjY0OThiZjU4IFJh
bWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODIgIAkJICAgICAgIERSTV9IRENQXzJfRENQX1NJR19T
SVpFKTsKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE4MyAgCjY0OThiZjU4IFJh
bWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODQgIAlpZiAoIXZybF9sZW5ndGgpIHsKNjQ5OGJmNTgg
UmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE4NSAgCQlEUk1fRVJST1IoIk5vIHZybCBmb3VuZFxu
Iik7CjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODYgIAkJcmV0dXJuIC1FSU5W
QUw7CjY0OThiZjU4IFJhbWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODcgIAl9CjY0OThiZjU4IFJh
bWFsaW5nYW0gQyAyMDE5LTA1LTA3ICAxODggIAo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0w
NS0wNyAgMTg5ICAJYnVmICs9IERSTV9IRENQXzJfVlJMX0xFTkdUSF9TSVpFOwo2NDk4YmY1OCBS
YW1hbGluZ2FtIEMgMjAxOS0wNS0wNyBAMTkwICAJa3N2X2NvdW50ID0gKCpidWYgPDwgMikgfCBE
Uk1fSERDUF8yX0tTVl9DT1VOVF8yX0xTQklUUygqKGJ1ZiArIDEpKTsKCiNkZWZpbmUgRFJNX0hE
Q1BfMl9LU1ZfQ09VTlRfMl9MU0JJVFMoYnl0ZSkgICAgICgoKGJ5dGUpICYgMHhDKSA+PiA2KQoK
MHhDID4+IDYgaXMgYWx3YXlzIHplcm8uCgo2NDk4YmY1OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0w
NyAgMTkxICAJaWYgKCFrc3ZfY291bnQpIHsKNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIwMTktMDUt
MDcgIDE5MiAgCQlEUk1fREVCVUcoIlJldm9rZWQgS1NWIGNvdW50IGlzIDBcbiIpOwo2NDk4YmY1
OCBSYW1hbGluZ2FtIEMgMjAxOS0wNS0wNyAgMTkzICAJCXJldHVybiBjb3VudDsKNjQ5OGJmNTgg
UmFtYWxpbmdhbSBDIDIwMTktMDUtMDcgIDE5NCAgCX0KNjQ5OGJmNTggUmFtYWxpbmdhbSBDIDIw
MTktMDUtMDcgIDE5NSAgCgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAg
ICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0cHM6Ly9saXN0cy4w
MS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAgSW50ZWwgQ29ycG9y
YXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
