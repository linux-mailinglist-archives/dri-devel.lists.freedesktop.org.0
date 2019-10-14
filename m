Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44CD5C23
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2276E0D5;
	Mon, 14 Oct 2019 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 704 seconds by postgrey-1.36 at gabe;
 Mon, 14 Oct 2019 06:30:41 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480FD89E36
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 06:30:41 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9E67aGJ077498
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 02:18:56 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vme59yhh0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 02:18:55 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <heiko.carstens@de.ibm.com>;
 Mon, 14 Oct 2019 07:18:53 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 07:18:49 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9E6Im7a40567074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 06:18:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 039EC4CCB7;
 Mon, 14 Oct 2019 06:18:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D2404CC9B;
 Mon, 14 Oct 2019 06:18:47 +0000 (GMT)
Received: from osiris (unknown [9.152.212.85])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Oct 2019 06:18:47 +0000 (GMT)
Date: Mon, 14 Oct 2019 08:18:46 +0200
From: Heiko Carstens <heiko.carstens@de.ibm.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/4] s390/zcrypt: fix memleak at release
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-5-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010131333.23635-5-johan@kernel.org>
X-TM-AS-GCONF: 00
x-cbid: 19101406-0008-0000-0000-00000321CE1C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101406-0009-0000-0000-00004A40DEC6
Message-Id: <20191014061846.GA6834@osiris>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=945 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140060
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
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
Cc: freedreno@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, stable <stable@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MTM6MzNQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IElmIGEgcHJvY2VzcyBpcyBpbnRlcnJ1cHRlZCB3aGlsZSBhY2Nlc3NpbmcgdGhlIGNy
eXB0byBkZXZpY2UgYW5kIHRoZQo+IGdsb2JhbCBhcF9wZXJtc19tdXRleCBpcyBjb250ZW50ZWQs
IHJlbGVhc2UoKSBjb3VsZCByZXR1cm4gZWFybHkgYW5kCj4gZmFpbCB0byBmcmVlIHJlbGF0ZWQg
cmVzb3VyY2VzLgo+IAo+IEZpeGVzOiAwMGZhYjIzNTBlNmIgKCJzMzkwL3pjcnlwdDogbXVsdGlw
bGUgemNyeXB0IGRldmljZSBub2RlcyBzdXBwb3J0IikKPiBDYzogc3RhYmxlIDxzdGFibGVAdmdl
ci5rZXJuZWwub3JnPiAgICAgIyA0LjE5Cj4gQ2M6IEhhcmFsZCBGcmV1ZGVuYmVyZ2VyIDxmcmV1
ZGVAbGludXguaWJtLmNvbT4KPiBDYzogTWFydGluIFNjaHdpZGVmc2t5IDxzY2h3aWRlZnNreUBk
ZS5pYm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9y
Zz4KPiAtLS0KPiAgZHJpdmVycy9zMzkwL2NyeXB0by96Y3J5cHRfYXBpLmMgfCAzICstLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0
aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
