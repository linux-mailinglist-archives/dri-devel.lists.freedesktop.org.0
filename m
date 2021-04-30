Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F736FF0E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 19:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A296E4E8;
	Fri, 30 Apr 2021 17:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1954 seconds by postgrey-1.36 at gabe;
 Fri, 30 Apr 2021 17:00:27 UTC
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.68.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5380E6E4E8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 17:00:27 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 0C0D5400C4BE7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:44:47 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id cVV3l8uGG1cHecVV3l97pZ; Fri, 30 Apr 2021 10:56:17 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Om4ZY5IbR19QUfg7UpptCRqjveQax7WqnKvkVNKEw60=; b=DkVi50Avya1CiFlM/pC74kdFZb
 DC5++rKV2ax2Pj+xzqzHZIp0+MzKKyA9u7coLXcUQ3S19AIyxbS0UXXkenkHuhghE9mjzRyNElVzb
 EiaXYAIefqo22e44jo5Gt+BnoZvFiKQexMpOdYL2Gpx6qKIf7NvSfKP4QpDKFy/cRyS/ceK4t5zEf
 BP9mJydmEVVwIpXm1EDvjEoi2yb5IKBzilP4xtQpAMKV4YmyS99k14k00wozGpCM2zZKA6DyabKj9
 VutcrxfmfxU+t2FWRHBzUllg6XvZdWWynd3nL20MWZjruty9oOVOR1tBUtFfUzvE1BpiWCdJn8bWs
 A9j85RSg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:33768
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lcVUy-003wNy-PP; Fri, 30 Apr 2021 10:56:12 -0500
Subject: Re: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <MN2PR12MB44881C5F5E24888E2590BF74F75E9@MN2PR12MB4488.namprd12.prod.outlook.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <eaf27853-916c-e095-7b7a-afb5256a6f67@embeddedor.com>
Date: Fri, 30 Apr 2021 10:56:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB44881C5F5E24888E2590BF74F75E9@MN2PR12MB4488.namprd12.prod.outlook.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lcVUy-003wNy-PP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:33768
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA0LzMwLzIxIDEwOjI2LCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4gW0FNRCBQdWJs
aWMgVXNlXQo+IAo+ICsgR3VzdGF2bywgYW1kLWdmeAo+IAo+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+PiBGcm9tOiBDaHJpc3RpYW4gWmlnb3R6a3kgPGNoemlnb3R6a3lAeGVub3NvZnQu
ZGU+Cj4+IFNlbnQ6IEZyaWRheSwgQXByaWwgMzAsIDIwMjEgODowMCBBTQo+PiBUbzogZ3VzdGF2
b2Fyc0BrZXJuZWwub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIgCj4+IDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPgo+PiBDYzogUi5ULkRpY2tpbnNvbiA8cnRkMkB4dHJhLmNvLm56PjsgRGFycmVu
IFN0ZXZlbnMgPGRhcnJlbkBzdGV2ZW5zLSAKPj4gem9uZS5uZXQ+OyBtYWQgc2thdGVtYW4gPG1h
ZHNrYXRlbWFuQGdtYWlsLmNvbT47IGxpbnV4cHBjLWRldiAKPj4gPGxpbnV4cHBjLWRldkBsaXN0
cy5vemxhYnMub3JnPjsgT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0PjsgCj4+IE1hbGlu
ZyBsaXN0IC0gRFJJIGRldmVsb3BlcnMgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
OyBNaWNoZWwgCj4+IETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD47IENocmlzdGlhbiBaaWdv
dHpreSA8aW5mb0B4ZW5vc29mdC5kZT4KPj4gU3ViamVjdDogUmFkZW9uIE5JOiBHSVQga2VybmVs
IHdpdGggdGhlIG5pc2xhbmRzX3NtYyBjb21taXQgZG9lc24ndCAKPj4gYm9vdCBvbiBhIEZyZWVz
Y2FsZSBQNTA0MCBib2FyZCBhbmQgUC5BLlNlbWkgTmVtbyBib2FyZAo+Pgo+PiBIZWxsbywKPj4K
Pj4gVGhlIE5lbW8gYm9hcmQgKEEtRU9OIEFtaWdhT25lIFgxMDAwKSBbMV0gYW5kIHRoZSBGU0wg
UDUwNDAgQ3lydXMrIAo+PiBib2FyZCAoQS1FT04gQW1pZ2FPbmUgWDUwMDApIFsyXSB3aXRoIGlu
c3RhbGxlZCBBTUQgUmFkZW9uIEhENjk3MCBOSSAKPj4gZ3JhcGhpY3MgY2FyZHMgKENheW1hbiBY
VCkgWzNdIGRvbid0IGJvb3Qgd2l0aCB0aGUgbGF0ZXN0IGdpdCBrZXJuZWwgCj4+IGFueW1vcmUg
YWZ0ZXIgdGhlIGNvbW1pdCAiZHJtL3JhZGVvbi9uaXNsYW5kc19zbWMuaDogUmVwbGFjZSAKPj4g
b25lLWVsZW1lbnQgYXJyYXkgd2l0aCBmbGV4aWJsZS1hcnJheSBtZW1iZXIgaW4gc3RydWN0IE5J
U0xBTkRTX1NNQ19TV1NUQVRFIGJyYW5jaCIgWzRdLgo+PiBUaGlzIGdpdCBrZXJuZWwgYm9vdHMg
aW4gYSB2aXJ0dWFsIGU1NTAwIFFFTVUgbWFjaGluZSB3aXRoIGEgVmlydElPLUdQVSBbNV0uCj4+
Cj4+IEkgYmlzZWN0ZWQgdG9kYXkgWzZdLgo+Pgo+PiBSZXN1bHQ6IGRybS9yYWRlb24vbmlzbGFu
ZHNfc21jLmg6IFJlcGxhY2Ugb25lLWVsZW1lbnQgYXJyYXkgd2l0aCAKPj4gZmxleGlibGUtYXJy
YXkgbWVtYmVyIGluIHN0cnVjdCBOSVNMQU5EU19TTUNfU1dTVEFURSBicmFuY2gKPj4gKDQzNGZi
MWU3NDQ0YTJlZmMzYTRlYmQ5NTBjN2Y3NzFlYmZjZmZhMzEpIFs0XSBpcyB0aGUgZmlyc3QgYmFk
IGNvbW1pdC4KPj4KPj4gSSB3YXMgYWJsZSB0byByZXZlcnQgdGhpcyBjb21taXQgWzddIGFuZCBh
ZnRlciBhIG5ldyBjb21waWxpbmcsIHRoZSAKPj4ga2VybmVsIGJvb3RzIHdpdGhvdXQgYW55IHBy
b2JsZW1zIG9uIG15IEFtaWdhT25lcy4KPj4KPj4gQWZ0ZXIgdGhhdCBJIGNyZWF0ZWQgYSBwYXRj
aCBmb3IgcmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGZvciBuZXcgZ2l0IHRlc3Qga2VybmVscy4KPj4g
WzNdCj4+Cj4+IFRoZSBrZXJuZWwgY29tcGlsZXMgYW5kIGJvb3RzIHdpdGggdGhpcyBwYXRjaCBv
biBteSBBbWlnYU9uZXMuIFBsZWFzZSAKPj4gZmluZCBhdHRhY2hlZCB0aGUga2VybmVsIGNvbmZp
ZyBmaWxlcy4KPj4KPj4gUGxlYXNlIGNoZWNrIHRoZSBmaXJzdCBiYWQgY29tbWl0LgoKSSdsbCBo
YXZlIGEgbG9vay4KClRoYW5rcyBmb3IgdGhlIHJlcG9ydCEKLS0KR3VzdGF2bwoKPj4KPj4gVGhh
bmtzLAo+PiBDaHJpc3RpYW4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVuLgo+PiB3aWtpcGVkaWEu
b3JnJTJGd2lraSUyRkFtaWdhT25lX1gxMDAwJmFtcDtkYXRhPTA0JTdDMDElN0NhbGV4YW5kCj4+
IGVyLmRldWNoZXIlNDBhbWQuY29tJTdDMDYyMjU0OTM4M2ZiNDMyMDM0NmIwOGQ5MGJjZjdiZTEl
N0MzZGQ4OQo+PiA2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU1Mzgw
ODY3MDE2MTY1MSU3Q1Vua24KPj4gb3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJawo+PiAxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEw
MDAmYW1wO3NkYXRhPVBOU3JBcFVkTXJrdTIwaEg3ZEVLbEpKCj4+IFRCaTdRcDVKT2txcEE0TXZL
cWRFJTNEJmFtcDtyZXNlcnZlZD0wCj4+IFsyXQo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRndpa2kuCj4+IGEgbWlnYS5v
cmclMkZpbmRleC5waHAlM0Z0aXRsZSUzRFg1MDAwJmFtcDtkYXRhPTA0JTdDMDElN0NhbGV4YW5k
ZXIKPj4gLmRldWNoZXIlNDBhbWQuY29tJTdDMDYyMjU0OTM4M2ZiNDMyMDM0NmIwOGQ5MGJjZjdi
ZTElN0MzZGQ4OTYxZgo+PiBlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU1
MzgwODY3MDE2MTY1MSU3Q1Vua25vdwo+PiBuJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYQo+PiBXd2lMQ0pYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPUI4VXZoczI1JTJGUDNSZm5MMUFnSUNOM1k0Cj4+IENFWGVDRTF5SW9p
M3Z2d3ZHdG8lM0QmYW1wO3Jlc2VydmVkPTAKPj4gWzNdCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmZvcnUKPj4gbS5o
eXBlcmlvbi0KPj4gZW50ZXJ0YWlubWVudC5jb20lMkZ2aWV3dG9waWMucGhwJTNGZiUzRDM1JTI2
dCUzRDQzNzcmYW1wO2RhdGE9Cj4+IDA0JTdDMDElN0NhbGV4YW5kZXIuZGV1Y2hlciU0MGFtZC5j
b20lN0MwNjIyNTQ5MzgzZmI0MzIwMzQ2YjA4ZAo+PiA5MGJjZjdiZTElN0MzZGQ4OTYxZmU0ODg0
ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NTUzODAKPj4gODY3MDE2MTY1MSU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJago+PiBvaVYybHVN
eklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9VG9rWHBs
RAo+PiBUdmczJTJCWk1QTENnUjFmcyUyQk4yWDlNSWZMWExXNjdNQU0yUXNrJTNEJmFtcDtyZXNl
cnZlZD0wCj4+IFs0XQo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQuCj4+IGsgZXJuZWwub3JnJTJGcHViJTJGc2Nt
JTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUKPj4gMkZjb21t
aXQlMkYlM0ZpZCUzRDQzNGZiMWU3NDQ0YTJlZmMzYTRlYmQ5NTBjN2Y3NzFlYmZjZmZhMzEmYW1w
O2QKPj4gYXRhPTA0JTdDMDElN0NhbGV4YW5kZXIuZGV1Y2hlciU0MGFtZC5jb20lN0MwNjIyNTQ5
MzgzZmI0MzIwMzQ2Cj4+IGIwOGQ5MGJjZjdiZTElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3NQo+PiA1MzgwODY3MDE2MTY1MSU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUwKPj4gQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9SkMKPj4gTTR4dlBFbldkY2tj
VFBiUTJVanYlMkZBaU1Nc0ZNenpsNFByJTJGUlBsY01RJTNEJmFtcDtyZXNlcnZlCj4+IGQ9MAo+
PiBbNV0gcWVtdS1zeXN0ZW0tcHBjNjQgLU0gcHBjZTUwMCAtY3B1IGU1NTAwIC1tIDEwMjQgLWtl
cm5lbCB1SW1hZ2UgLSAKPj4gZHJpdmUgZm9ybWF0PXJhdyxmaWxlPU1pbnRQUEMzMi1YNTAwMC5p
bWcsaW5kZXg9MCxpZj12aXJ0aW8gLW5ldGRldgo+PiB1c2VyLGlkPW15bmV0MCAtZGV2aWNlIHZp
cnRpby1uZXQtcGNpLG5ldGRldj1teW5ldDAgLWFwcGVuZCAicncgCj4+IHJvb3Q9L2Rldi92ZGEi
IC1kZXZpY2UgdmlydGlvLXZnYSAtdXNiIC1kZXZpY2UgdXNiLWVoY2ksaWQ9ZWhjaSAKPj4gLWRl
dmljZSB1c2ItIHRhYmxldCAtZGV2aWNlIHZpcnRpby1rZXlib2FyZC1wY2kgLXNtcCA0IC12bmMg
OjEgWzZdIAo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZmb3J1Cj4+IG0uaHlwZXJpb24tCj4+IGVudGVydGFpbm1lbnQu
Y29tJTJGdmlld3RvcGljLnBocCUzRnAlM0Q1MzA3NCUyM3A1MzA3NCZhbXA7ZGF0YQo+PiA9MDQl
N0MwMSU3Q2FsZXhhbmRlci5kZXVjaGVyJTQwYW1kLmNvbSU3QzA2MjI1NDkzODNmYjQzMjAzNDZi
MDgKPj4gZDkwYmNmN2JlMSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc1NTM4Cj4+IDA4NjcwMTYxNjUxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUQo+PiBJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1SWGZTbFkKPj4gQTNiREVGYXMwJTJGazJ2TVdzbDJs
MG51aFMyZWNqWmdTQkxjJTJCczQlM0QmYW1wO3Jlc2VydmVkPTAKPj4gWzddIGdpdCByZXZlcnQg
NDM0ZmIxZTc0NDRhMmVmYzNhNGViZDk1MGM3Zjc3MWViZmNmZmEzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
