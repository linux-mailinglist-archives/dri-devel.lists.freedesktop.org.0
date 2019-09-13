Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591ACB28DE
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 01:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E516F4A5;
	Fri, 13 Sep 2019 23:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1438A6F4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 23:26:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DNEQ61054576;
 Fri, 13 Sep 2019 23:26:57 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2uytd3qc2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 23:26:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DNJC3N010784;
 Fri, 13 Sep 2019 23:26:57 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2v0cwk7bf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 23:26:57 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8DNQumR000967;
 Fri, 13 Sep 2019 23:26:56 GMT
Received: from [10.132.94.47] (/10.132.94.47)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Sep 2019 16:26:56 -0700
Subject: Re: [PATCH libdrm] meson: Fix sys/mkdev.h detection on Solaris
To: Eric Engestrom <eric.engestrom@intel.com>
References: <20190909235116.19290-1-alan.coopersmith@oracle.com>
 <20190910125520.skda23msaby6otdp@intel.com>
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Message-ID: <857dc94f-5356-842f-fcc1-f143d63b88eb@oracle.com>
Date: Fri, 13 Sep 2019 16:26:55 -0700
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910125520.skda23msaby6otdp@intel.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909130227
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909130227
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=byAq1efT3OYPfmRpKybP42HkFWodpK2Pw+gxzQGsO8o=;
 b=Zlb/9EdsiG92HK60gAcRAZFOWvMHv219VoU1zm9ZTMLdmkJfDdJo2/m01grk/tSjer/j
 dF3cMPAaGu5GW6bjU2geWrjnqCLIEAqCnn6jwi5+fSbqSefUVWW3hrHD4PiNQ6qAEVeE
 z2Vlx2BGeULkBL9QqRxaYiGhosGq2uUaudRWQlxdzgPaZsLid3zBPgGc6ziRJ2Bq8qPv
 zsE5u2hnrIwhW5bWptAoABqZaFJJc8ptYS6BSz1rrF4xCFfsaYJswnSRt2Bb8DL9vwNm
 TMkC+8b3gWCM9DDLHTP4HYFw0oyGJxdGd/HKYDZTaFt1pgVd9otu16gqFDZnoVYPJdQw vQ== 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMC8xOSA1OjU1IEFNLCBFcmljIEVuZ2VzdHJvbSB3cm90ZToKPiBPbiBNb25kYXksIDIw
MTktMDktMDkgMTY6NTE6MTYgLTA3MDAsIEFsYW4gQ29vcGVyc21pdGggd3JvdGU6Cj4+IE9uIFNv
bGFyaXMsIHN5cy9zeXNtYWNyb3MuaCBoYXMgbG9uZy1kZXByZWNhdGVkIGNvcGllcyBvZiBtYWpv
cigpICYgbWlub3IoKQo+PiBidXQgbm90IG1ha2VkZXYoKS4gIHN5cy9ta2Rldi5oIGhhcyBhbGwg
dGhyZWUgYW5kIGlzIHRoZSBwcmVmZXJyZWQgY2hvaWNlLgo+Pgo+PiBTbyB3ZSBjaGVjayBmb3Ig
c3lzL21rZGV2LmggZmlyc3QsIGFzIGF1dG9jb25mJ3MgQUNfSEVBREVSX01BSk9SIGRvZXMuCj4g
Cj4gUmV2aWV3ZWQtYnk6IEVyaWMgRW5nZXN0cm9tIDxlcmljLmVuZ2VzdHJvbUBpbnRlbC5jb20+
Cj4gCj4gQWx0ZXJuYXRpdmVseSwgaG93IGFib3V0IHRoaXM/Cj4gLS0tODwtLS0KPiBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAo+IGluZGV4IGJjNWNmYzU4OGQwYzYyMWE5
NzI1Li4yNjNmNjkxYWIyYjkxMDdmNWJlMSAxMDA2NDQKPiAtLS0gYS9tZXNvbi5idWlsZAo+ICsr
KyBiL21lc29uLmJ1aWxkCj4gQEAgLTE4Myw5ICsxODMsMTQgQEAgZm9yZWFjaCBoZWFkZXIgOiBb
J3N5cy9zeXNjdGwuaCcsICdzeXMvc2VsZWN0LmgnLCAnYWxsb2NhLmgnXQo+ICAgICBjb25maWcu
c2V0KCdIQVZFXycgKyBoZWFkZXIudW5kZXJzY29yaWZ5KCkudG9fdXBwZXIoKSwKPiAgICAgICBj
Yy5jb21waWxlcygnI2luY2x1ZGUgPEAwQD4nLmZvcm1hdChoZWFkZXIpLCBuYW1lIDogJ0AwQCB3
b3JrcycuZm9ybWF0KGhlYWRlcikpKQo+ICAgZW5kZm9yZWFjaAo+IC1pZiBjYy5oYXNfaGVhZGVy
X3N5bWJvbCgnc3lzL3N5c21hY3Jvcy5oJywgJ21ham9yJykKPiAraWYgKGNjLmhhc19oZWFkZXJf
c3ltYm9sKCdzeXMvc3lzbWFjcm9zLmgnLCAnbWFqb3InKSBhbmQKPiArICBjYy5oYXNfaGVhZGVy
X3N5bWJvbCgnc3lzL3N5c21hY3Jvcy5oJywgJ21pbm9yJykgYW5kCj4gKyAgY2MuaGFzX2hlYWRl
cl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcsICdtYWtlZGV2JykpCj4gICAgIGNvbmZpZy5zZXQx
MCgnTUFKT1JfSU5fU1lTTUFDUk9TJywgdHJ1ZSkKPiAtZWxpZiBjYy5oYXNfaGVhZGVyX3N5bWJv
bCgnc3lzL21rZGV2LmgnLCAnbWFqb3InKQo+ICtlbmRpZgo+ICtpZiAoY2MuaGFzX2hlYWRlcl9z
eW1ib2woJ3N5cy9ta2Rldi5oJywgJ21ham9yJykgYW5kCj4gKyAgY2MuaGFzX2hlYWRlcl9zeW1i
b2woJ3N5cy9ta2Rldi5oJywgJ21pbm9yJykgYW5kCj4gKyAgY2MuaGFzX2hlYWRlcl9zeW1ib2wo
J3N5cy9ta2Rldi5oJywgJ21ha2VkZXYnKSkKPiAgICAgY29uZmlnLnNldDEwKCdNQUpPUl9JTl9N
S0RFVicsIHRydWUpCj4gICBlbmRpZgo+ICAgY29uZmlnLnNldDEwKCdIQVZFX09QRU5fTUVNU1RS
RUFNJywgY2MuaGFzX2Z1bmN0aW9uKCdvcGVuX21lbXN0cmVhbScpKQo+IC0tLT44LS0tCj4gCj4g
TWFrZXMgYm90aCBjaGVja3MgaW5kZXBlbmRlbnQgYW5kIHJlcHJlc2VudCB0aGUgcmVhbGl0eSBv
ZiB3aGF0J3Mgd2FudGVkCj4gbW9yZSBhY2N1cmF0ZWx5IChkZXNwaXRlIHRoZSBoaXN0b3JpY2Fs
IG5hbWUgb2YgdGhlIG1hY3JvKS4KClRoYXQgd29ya3M6CgpIZWFkZXIgPHN5cy9zeXNtYWNyb3Mu
aD4gaGFzIHN5bWJvbCAibWFqb3IiIDogWUVTIChjYWNoZWQpCkhlYWRlciA8c3lzL3N5c21hY3Jv
cy5oPiBoYXMgc3ltYm9sICJtaW5vciIgOiBZRVMKSGVhZGVyIDxzeXMvc3lzbWFjcm9zLmg+IGhh
cyBzeW1ib2wgIm1ha2VkZXYiIDogTk8KSGVhZGVyIDxzeXMvbWtkZXYuaD4gaGFzIHN5bWJvbCAi
bWFqb3IiIDogWUVTCkhlYWRlciA8c3lzL21rZGV2Lmg+IGhhcyBzeW1ib2wgIm1pbm9yIiA6IFlF
UwpIZWFkZXIgPHN5cy9ta2Rldi5oPiBoYXMgc3ltYm9sICJtYWtlZGV2IiA6IFlFUwoKV291bGQg
eW91IGxpa2UgbWUgdG8gcmVzdWJtaXQgd2l0aCB0aGF0LCBvciBkbyB5b3Ugd2FudCB0byBzdWJt
aXQgaXQ/CgpJZiB5b3Ugd2FudCB0byBnbyBhaGVhZCwgdGhlbjoKClJldmlld2VkLWJ5OiBBbGFu
IENvb3BlcnNtaXRoIDxhbGFuLmNvb3BlcnNtaXRoQG9yYWNsZS5jb20+ClRlc3RlZC1ieTogQWxh
biBDb29wZXJzbWl0aCA8YWxhbi5jb29wZXJzbWl0aEBvcmFjbGUuY29tPgoKLS0gCgktQWxhbiBD
b29wZXJzbWl0aC0gICAgICAgICAgICAgICBhbGFuLmNvb3BlcnNtaXRoQG9yYWNsZS5jb20KCSBP
cmFjbGUgU29sYXJpcyBFbmdpbmVlcmluZyAtIGh0dHBzOi8vYmxvZ3Mub3JhY2xlLmNvbS9hbGFu
YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
