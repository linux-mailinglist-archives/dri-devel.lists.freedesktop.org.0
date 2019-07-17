Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF86CA0D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAAE6E32A;
	Thu, 18 Jul 2019 07:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 855 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jul 2019 14:37:49 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEEC6E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 14:37:49 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HEIJrJ061063
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 10:23:33 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tt2w37j4j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 10:23:33 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <jremus@linux.ibm.com>;
 Wed, 17 Jul 2019 15:23:31 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 15:23:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HENQCl49938456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 14:23:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 125BB11C075;
 Wed, 17 Jul 2019 14:23:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B35A211C070;
 Wed, 17 Jul 2019 14:23:25 +0000 (GMT)
Received: from [9.152.97.218] (unknown [9.152.97.218])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jul 2019 14:23:25 +0000 (GMT)
From: Jens Remus <jremus@linux.ibm.com>
Subject: WARNING in con_is_bound
To: Daniel Vetter <daniel.vetter@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-s390@vger.kernel.org
Organization: IBM Deutschland Research & Development GmbH
Date: Wed, 17 Jul 2019 16:23:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071714-4275-0000-0000-0000034E26D2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071714-4276-0000-0000-0000385E3D1A
Message-Id: <84012ee0-e1e3-2eef-b927-b865fd141f78@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=812 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170170
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:39:55 +0000
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
 Adam Borowski <kilobyte@angband.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpPdXIgQ0kgb24gczM5MHggY29uc3RhbnRseSB0cmlnZ2VycyB0aGUgZm9sbG93aW5n
IHdhcm5pbmcgaW4gZnVuY3Rpb24gY29uX2lzX2JvdW5kKCkgd2hlbiByZWFkaW5nIHRoZSBTeXNG
UyBhdHRyaWJ1dGUgL3N5cy9jbGFzcy92dGNvbnNvbGUvdnRjb24wL2JpbmQuCkkgdmVyaWZpZWQg
dGhpcyB0byBiZSB0aGUgY2FzZSBzaW5jZSBXQVJOX0NPTlNPTEVfVU5MT0NLRUQoKSB3YXMgaW50
cm9kdWNlZCBpbiBmdW5jdGlvbiBjb25faXNfYm91bmQoKSB3aXRoIGNvbW1pdCBkZGRlM2MxOGI3
MDAgKCJ2dDogTW9yZSBsb2NraW5nIGNoZWNrcyIpLCB3aGljaCBoYXMgcmVjZW50bHkgYmVlbiBt
ZXJnZWQgaW50byBMaW51cycgbWFzdGVyIGJyYW5jaC4KCgpGcm9tIENJIHdpdGggcmVjZW50IExp
bnVzJyBtYXN0ZXIgYnJhbmNoIGJ1aWx0IHdpdGggYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmln
LiBkdW1wMnRhciBpcyBhIHV0aWxpdHkgd2UgdXNlIHRvIGNvbGxlY3QgdGhlIHdob2xlIFN5c0ZT
IGFzIHRhciBhcmNoaXZlIGZvciBwcm9ibGVtIGRldGVybWluYXRpb24uCgpXQVJOSU5HOiBDUFU6
IDcgUElEOiA0Nzc1OCBhdCBkcml2ZXJzL3R0eS92dC92dC5jOjM4MjUgY29uX2lzX2JvdW5kKzB4
OGUvMHg5OApLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogcGFuaWNfb25fd2FybiBzZXQgLi4u
CkNQVTogNyBQSUQ6IDQ3NzU4IENvbW06IGR1bXAydGFyIFRhaW50ZWQ6IEcgICAgICAgICAgIE9F
ICAgICA1LjMuMC0yMDE5MDcxNS5yYzAuZ2l0MC4xZDAzOTg1OTMzMGIuMzAxLmZjMzAuczM5MHgr
Z2l0ICMxCkhhcmR3YXJlIG5hbWU6IElCTSAuLi4gKHovVk0gNy4xLjApCkNhbGwgVHJhY2U6Cihb
PDAwMDAwMDAwMjkxYjdiNDY+XSBzaG93X3N0YWNrKzB4OGUvMHhkMCkKIFs8MDAwMDAwMDAyOWI4
MjI0Mj5dIGR1bXBfc3RhY2srMHg3YS8weGE4CiBbPDAwMDAwMDAwMjkxZTlhZWE+XSBwYW5pYysw
eDExMi8weDMwOAogWzwwMDAwMDAwMDI5MWU5OTFhPl0gX193YXJuKzB4YzIvMHgxMTgKIFs8MDAw
MDAwMDAyOWI4MTMxMj5dIHJlcG9ydF9idWcrMHhmYS8weDE1OAogWzwwMDAwMDAwMDI5MWE1MzRj
Pl0gZG9fcmVwb3J0X3RyYXArMHhjNC8weGUwCiBbPDAwMDAwMDAwMjkxYTU1MjI+XSBpbGxlZ2Fs
X29wKzB4MTNhLzB4MTUwCiBbPDAwMDAwMDAwMjliYTJhMWM+XSBwZ21fY2hlY2tfaGFuZGxlcisw
eDFjOC8weDIyMAogWzwwMDAwMDAwMDI5ODc3NjI2Pl0gY29uX2lzX2JvdW5kKzB4OGUvMHg5OAoo
WzwwMDAwMDAwMDhmZWQyODIwPl0gMHg4ZmVkMjgyMCkKIFs8MDAwMDAwMDAyOTg3ODUwMj5dIHNo
b3dfYmluZCsweDMyLzB4NTgKIFs8MDAwMDAwMDAyOThmNDZmND5dIGRldl9hdHRyX3Nob3crMHgy
Yy8weDcwCiBbPDAwMDAwMDAwMjk0ZDU3YWM+XSBzeXNmc19rZl9zZXFfc2hvdysweGFjLzB4MTU4
CiBbPDAwMDAwMDAwMjk0NTY1YTA+XSBzZXFfcmVhZCsweGUwLzB4NDc4CiBbPDAwMDAwMDAwMjk0
Mjc3NGM+XSB2ZnNfcmVhZCsweDk0LzB4MTUwCiBbPDAwMDAwMDAwMjk0MjdiMTA+XSBrc3lzX3Jl
YWQrMHg2OC8weGY4CiBbPDAwMDAwMDAwMjliYTI2MjQ+XSBzeXN0ZW1fY2FsbCsweGQ4LzB4MmM4
CgoKRnJvbSB2ZXJpZmljYXRpb24gd2l0aCBLZXJuZWwgYmFzZWQgb24gY29tbWl0IGRkZGUzYzE4
YjcwMCAoInZ0OiBNb3JlIGxvY2tpbmcgY2hlY2tzIikgYnVpbHQgd2l0aCBhcmNoL3MzOTAvY29u
Zmlncy9wZXJmb3JtYW5jZV9kZWZjb25maWcuIEkgdXNlZCBjYXQgL3N5cy9jbGFzcy92dGNvbnNv
bGUvdnRjb24wL2JpbmQgdG8gdHJpZ2dlciB0aGUgd2FybmluZy4KCldBUk5JTkc6IENQVTogMCBQ
SUQ6IDkyMyBhdCBkcml2ZXJzL3R0eS92dC92dC5jOjM4MjUgY29uX2lzX2JvdW5kKzB4OGUvMHg5
OApNb2R1bGVzIGxpbmtlZCBpbjogLi4uCkNQVTogMCBQSUQ6IDkyMyBDb21tOiBjYXQgTm90IHRh
aW50ZWQgNS4yLjAtcmM0LTAwMDA0LWdkZGRlM2MxOGI3MDAgIzIKSGFyZHdhcmUgbmFtZTogSUJN
IDM5MDYgTTAzIDcwMyAoei9WTSA3LjEuMCkKS3JubCBQU1cgOiAwNzA0YzAwMTgwMDAwMDAwIDAw
MDAwMDAwNDE0MTg4NTYgKGNvbl9pc19ib3VuZCsweDhlLzB4OTgpCiAgICAgICAgICAgUjowIFQ6
MSBJTzoxIEVYOjEgS2V5OjAgTToxIFc6MCBQOjAgQVM6MyBDQzowIFBNOjAgUkk6MCBFQTozCkty
bmwgR1BSUzogMDAwMDAwMDAzZDZhNDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMDA0MWIzY2Q4OAogICAgICAgICAgIDAwMDAwMDAwN2FiYTMwMDAgMDAwMDAwMDA0
MTQ5MzM3OCAwMDAwMDAwMDdiNTJiNDI4IDAwMDAwMDAwMDAwMDAwMDAKICAgICAgICAgICAwMDAw
MDNlMDAwYWJmZWY4IDAwMDAwMDAwNzhkYzY1NDAgMDAwMDAwMDA0MWJiZTMxMCAwMDAwMDAwMDQx
YmJiZjEwCiAgICAgICAgICAgMDAwMDAwMDA3YWM0YTAwMCAwMDAwMDAwMDdiNTJiNDQwIDAwMDAw
MDAwNDE0MTg4NDIgMDAwMDAzZTAwMGFiZmNhOApLcm5sIENvZGU6IDAwMDAwMDAwNDE0MTg4NGM6
IDE2MTIgICAgICAgICAgICAgICAgb3IgICAgICAlcjEsJXIyCiAgICAgICAgICAgMDAwMDAwMDA0
MTQxODg0ZTogYTc3NGZmZDUgICAgICAgICAgICBicmMgICAgIDcsNDE0MTg3ZjgKICAgICAgICAg
ICMwMDAwMDAwMDQxNDE4ODUyOiBhN2Y0MDAwMSAgICAgICAgICAgIGJyYyAgICAgMTUsNDE0MTg4
NTQKICAgICAgICAgID4wMDAwMDAwMDQxNDE4ODU2OiBhN2Y0ZmZkMSAgICAgICAgICAgIGJyYyAg
ICAgMTUsNDE0MTg3ZjgKICAgICAgICAgICAwMDAwMDAwMDQxNDE4ODVhOiAwNzA3ICAgICAgICAg
ICAgICAgIGJjciAgICAgMCwlcjcKICAgICAgICAgICAwMDAwMDAwMDQxNDE4ODVjOiAwNzA3ICAg
ICAgICAgICAgICAgIGJjciAgICAgMCwlcjcKICAgICAgICAgICAwMDAwMDAwMDQxNDE4ODVlOiAw
NzA3ICAgICAgICAgICAgICAgIGJjciAgICAgMCwlcjcKICAgICAgICAgICAwMDAwMDAwMDQxNDE4
ODYwOiBjMDA0MDAwMDAwMDAgICAgICAgIGJyY2wgICAgMCw0MTQxODg2MApDYWxsIFRyYWNlOgoo
WzwwMDAwMDNlMDAwYWJmY2EwPl0gMHgzZTAwMGFiZmNhMCkKIFs8MDAwMDAwMDA0MTQxOTczMj5d
IHNob3dfYmluZCsweDMyLzB4NTgKIFs8MDAwMDAwMDA0MTQ5MzNhOD5dIGRldl9hdHRyX3Nob3cr
MHgzMC8weDcwCiBbPDAwMDAwMDAwNDEwNzk4ZTg+XSBzeXNmc19rZl9zZXFfc2hvdysweGIwLzB4
MTU4CiBbPDAwMDAwMDAwNDBmZmE5NWM+XSBzZXFfcmVhZCsweGU0LzB4NDc4CiBbPDAwMDAwMDAw
NDBmY2JlODQ+XSB2ZnNfcmVhZCsweDk0LzB4MTUwCiBbPDAwMDAwMDAwNDBmY2MyNDg+XSBrc3lz
X3JlYWQrMHg2OC8weGY4CiBbPDAwMDAwMDAwNDE3MzM1MzA+XSBzeXN0ZW1fY2FsbCsweGRjLzB4
MmM4Ckxhc3QgQnJlYWtpbmctRXZlbnQtQWRkcmVzczoKIFs8MDAwMDAwMDA0MTQxODg1Mj5dIGNv
bl9pc19ib3VuZCsweDhhLzB4OTgKLS0tWyBlbmQgdHJhY2UgODBlMDVlMDVlYzJlZTY2MCBdLS0t
CgoKVGhhbmtzIGFuZCByZWdhcmRzLApKZW5zIFJlbXVzCi0tIApMaW51eCBvbiBaIGFuZCB6L1ZT
RSBEZXZlbG9wbWVudCAmIFNlcnZpY2UgKEQzMjI5KQpJQk0gU3lzdGVtcyAmIFRlY2hub2xvZ3kg
R3JvdXAsIFB1cmUgU3lzdGVtcyAmIE1vZHVsYXIgU29mdHdhcmUgRGV2ZWxvcG1lbnQKCklCTSBE
YXRhIFByaXZhY3kgU3RhdGVtZW50OiBodHRwczovL3d3dy5pYm0uY29tL3ByaXZhY3kvdXMvZW4v
CgpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJIClZvcnNpdHplbmRl
ciBkZXMgQXVmc2ljaHRzcmF0czogTWF0dGhpYXMgSGFydG1hbm4KR2VzY2jDpGZ0c2bDvGhydW5n
OiBEaXJrIFdpdHRrb3BwClNpdHogZGVyIEdlc2VsbHNjaGFmdDogQm9lYmxpbmdlbgpSZWdpc3Rl
cmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDI0MzI5NAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
