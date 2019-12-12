Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687C311CCAA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 12:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87376E0CD;
	Thu, 12 Dec 2019 11:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2019 11:59:52 UTC
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3056E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=6820; q=dns/txt; s=iport;
 t=1576151992; x=1577361592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=40yj+jy1kh8Q+k8RxzmXx8xCUpXSc4w866bukarDJUo=;
 b=TIJAaA6gSD4FB61Ukdxjlm7XF+l/xwMthwwRHPYsGM86QEAhmQOazuxU
 kZDCS1H724e/SY/BFhd9mNnQ+A4m9gwxZEWEX7w1ibQbZm/xq2Mh8oHfu
 e3SNATR2LJ94wua++KMK+Mu/J272h9jQw/QoH+yjSjpf9uCGFGYDZKLgN 8=;
IronPort-PHdr: =?us-ascii?q?9a23=3Aobcm4BSMeAhlICOogdX04waNq9psv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESXBNfA8/wRje3QvuigQmEG7Zub+FE6OJ1XH1?=
 =?us-ascii?q?5g640NmhA4RsuMCEn1NvnvOi45G95ZUlJ+13q6KkNSXs35Yg6arw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C0AACdKPJd/5pdJa1lGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYF+gUtQBWxYIAQLKoNDQINGA4sIgjolmAaCUgN?=
 =?us-ascii?q?UCQEBAQwBARgLCgIBAYRAAheBcyQ4EwIDDQEBBAEBAQIBBQRthTcMhV4BAQE?=
 =?us-ascii?q?BAgEBAQoGEQQNDAEBLAsBBAsCAQYCGAICJgICAiUBChUQAgQOBSKDAAGCRgM?=
 =?us-ascii?q?OIAEOkSyQZAKBOIhhdX8zgn4BAQWFBhiCFwMGgQ4ojBgagUE/gTgMgmA+gmQ?=
 =?us-ascii?q?BBIF3gnmCXpAunkUKgjCHJIUzg1uFQQYbmkGXF5FxAgQCBAUCDgEBBYFpIoF?=
 =?us-ascii?q?YcBU7gmxQERSQIAkDF4NQhRSFP3QBgSeOfQEB?=
X-IronPort-AV: E=Sophos;i="5.69,305,1571702400"; d="scan'208";a="391449676"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
 by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 12 Dec 2019 11:52:45 +0000
Received: from XCH-ALN-010.cisco.com (xch-aln-010.cisco.com [173.36.7.20])
 by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id xBCBqjWT012302
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 12 Dec 2019 11:52:45 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-010.cisco.com
 (173.36.7.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Dec 2019 05:52:44 -0600
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by xhs-rtp-001.cisco.com
 (64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Dec 2019 06:52:43 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-002.cisco.com (173.37.227.247) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 12 Dec 2019 05:52:43 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcR4oDn3vn4fDfyBDVp9wy4h65jqqXaWAVa0yCC3Iy/RNouCQsHsXOv6YKbwr5dsmkRANu3duE9X3nwLxRl31E5FdkA6tbBAmKceSV9rUE0BIoFqf3WvdXeOEVP5QmEXH0Hdbcr95iDhzIjQvdcndpJCH+bSwJnY7nkp8095S3kIQWZ3TsNL/X+pCqkG8fHnds2215Qic1X5PCSqDbII6+mYYCpvBWNVo3+1JKhByOp2ryLsGkPJFIjEbUut92RyiQZzB3QxxAyT54qWHjIuJGWVXolvUyU2NF8dXk3ISBFp/lZ9XJj81kCOaPBzyIICc8zWjPwcpOOtkt3NfUgNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40yj+jy1kh8Q+k8RxzmXx8xCUpXSc4w866bukarDJUo=;
 b=j2+jDdQ7LF1gPAu9WCtTMYSlT9VodsoAXiBZ1PJDUtJArlAmnTEeYkYBlGguedf83Hv9GAZhelpK+u5KUJ3jPW5P2zNfy9Mkq0LcTDle/wfwq6K/L+/mpVW9cTDaNKBu1wy4PtUqAEKgOjEEazCgdLG3ubfzGEDHSzhr3u3HY/au5XF/fLQQzNGwcFS6fSli26SDAAn5IiJWUhTnMVZUgFNg1SEMsGWHauXQ4hDPngHBZh1VHYxSkiSR50h33teV15dR4IUy7riJ8RQrMNUrBgI/XqsLryFHGG1w64rt4sADdYTw9Doosw98MZj7QI740pISeAWy4gMufQN/HFZRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40yj+jy1kh8Q+k8RxzmXx8xCUpXSc4w866bukarDJUo=;
 b=IrvPvXRz2/gGXW3va9LSHIXlBbpKVIGRBR5QixxbQIw79EO783ien1jW9bqY20vhZjGG8T0VlbqMQXtNNpRUd7JA8YZGW0ED0WFPHcbZC52VXfRAuwnTkKdsC5LrGOL83Uo+8seJ0JZdr/WV4XhXdEw0pV4wgopcdP/wQI2ur6A=
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com (10.174.104.137) by
 DM5PR1101MB2076.namprd11.prod.outlook.com (10.174.106.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Thu, 12 Dec 2019 11:52:42 +0000
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::706d:2613:14d8:5d42]) by DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::706d:2613:14d8:5d42%6]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 11:52:42 +0000
From: "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] video: hdmi: indicate applicability in avi infoframe
 log
Thread-Topic: [PATCH v2] video: hdmi: indicate applicability in avi infoframe
 log
Thread-Index: AQHVsAg1CYFLXsKkfUGtS3wEQDBFsae1GlQAgAFK7IA=
Date: Thu, 12 Dec 2019 11:52:41 +0000
Message-ID: <2df4f7b1-ce1f-5015-11fb-fb9de551c656@cisco.com>
References: <20191211094842.165087-1-jkorsnes@cisco.com>
 <20191211160816.GK1208@intel.com>
In-Reply-To: <20191211160816.GK1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
x-originating-ip: [2001:420:44c1:2576:5a2f:415d:31e3:2554]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e159a6b2-f48f-4703-3d92-08d77ef9cb75
x-ms-traffictypediagnostic: DM5PR1101MB2076:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB20761A138A50412DFB824311D7550@DM5PR1101MB2076.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:154;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(31696002)(2616005)(36756003)(81156014)(66574012)(478600001)(31686004)(81166006)(6512007)(5660300002)(186003)(53546011)(8936002)(6916009)(316002)(4326008)(86362001)(91956017)(76116006)(54906003)(2906002)(8676002)(71200400001)(6486002)(66446008)(64756008)(66946007)(966005)(66556008)(6506007)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1101MB2076;
 H:DM5PR1101MB2140.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AmkcmqbMEBy6AyWvfa5GovE1eyQQLBZPg473H4jG9cn5ad6VcmUPjn0cKEQl/lhuEfSzSV0cKrKDjK45DVTCVAoXpW/CHDhd3Xq7hRSV5/eaPMfI6E1Iq2IIWaJdPplbUx9O/WANx88IgfOYKCZ9vDxScExBpmadb+dUMvRuch/yuqSzVZDmjJwBDrlqOtJkrmdfPM0u21ojMTb0hpERnl9wqewrlUkKjnqDkMQ4+kGSZK+w42dLRMdtQsMFGnyk6g8tTCdSKlS2Z59DqRBSCpHWNl1FoMRmB/+uIE7vYvoYnSz2RkcoSgdyl0qfcGdSGsy1t+T1GWKu5e2cq7N8AApBmb0qdGrIBzHgKIzqIm+jflJVM4NdVM7vVnCLi3ZtzyoCHLSJ8iSYYaLampiz3bMWCPNNwCl2fmctyz/98fkOcgyJecycGFXYbyWz0pFI
Content-ID: <41D395CD2E8F054386AD3125E1603757@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e159a6b2-f48f-4703-3d92-08d77ef9cb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 11:52:41.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0XNBr2LovZuNCDOqapP2ZxamgeGymWq0hiMPAJJy7XZ04+rXpHdN8aKcVHyi3OC051c2D1+WaWCMJ9lsXWRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2076
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.20, xch-aln-010.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
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
Cc: "Hans Verkuil \(hansverk\)" <hansverk@cisco.com>,
 "Martin Bugge \(marbugge\)" <marbugge@cisco.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTEvMTkgNTowOCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0KPiBPbiBXZWQsIERl
YyAxMSwgMjAxOSBhdCAxMDo0ODo0MkFNICswMTAwLCBKb2hhbiBLb3JzbmVzIHdyb3RlOg0KPj4g
V2hlbiBsb2dnaW5nIHRoZSBBVkkgSW5mb0ZyYW1lLCBjbGVhcmx5IGluZGljYXRlIHdoZXRoZXIg
b3Igbm90DQo+PiBhdHRyaWJ1dGVzIGFyZSBhY3RpdmUvImluIGVmZmVjdCIuIFRoZSBzcGVjaWZp
Y2F0aW9uIGlzIGdpdmVuIGluDQo+PiBDVEEtODYxLUcgU2VjdGlvbiA2LjQ6IEZvcm1hdCBvZiBW
ZXJzaW9uIDIsIDMgJiA0IEFWSSBJbmZvRnJhbWVzLg0KPj4NCj4+IEF0dHJpYnV0ZSAgICAgICAg
IEJ5dGVzICAgIFJlcXVpcmVtZW50DQo+PiBFeHQuIENvbG9yaW1ldHJ5ICBFQzAuLkVDMiBDb2xv
cmltZXRyeSAoQzAsQzEpIHNldCB0byBFeHRlbmRlZC4NCj4+IElUIENvbnRlbnRzIFR5cGUgIENO
MCxDTjEgIElUIENvbnRlbnQgKElUQykgc2V0IHRvIFRydWUuDQo+PiBSR0IgUXVhbnQuIFJhbmdl
ICBRMCxRMSAgICBDb2xvciBTcGFjZSAoWTAuLlkyKSBzZXQgdG8gUkdCLg0KPj4gWUNDIFF1YW50
LiBSYW5nZSAgWVEwLFlRMSAgQ29sb3Igc3BhY2UgKFkwLi5ZMikgc2V0IHRvIFlDYkNyLg0KPj4N
Cj4+IEV4YW1wbGUgbG9nIG91dHB1dCB3aXRoIHBhdGNoIGFwcGxpZWQ6DQo+PiBIRE1JIGluZm9m
cmFtZTogQXV4aWxpYXJ5IFZpZGVvIEluZm9ybWF0aW9uIChBVkkpLCB2ZXJzaW9uIDIsIGxlbmd0
aCAxMw0KPj4gICAgIGNvbG9yc3BhY2U6IFJHQg0KPj4gICAgIHNjYW4gbW9kZTogTm8gRGF0YQ0K
Pj4gICAgIGNvbG9yaW1ldHJ5OiBJVFU3MDkNCj4+ICAgICBwaWN0dXJlIGFzcGVjdDogMTY6OQ0K
Pj4gICAgIGFjdGl2ZSBhc3BlY3Q6IFNhbWUgYXMgUGljdHVyZQ0KPj4gICAgIGl0YzogSVQgQ29u
dGVudA0KPj4gICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5OiBOL0EgKDB4MCkNCj4+ICAgICBxdWFu
dGl6YXRpb24gcmFuZ2U6IEZ1bGwNCj4+ICAgICBudXBzOiBVbmtub3duIE5vbi11bmlmb3JtIFNj
YWxpbmcNCj4+ICAgICB2aWRlbyBjb2RlOiAxNg0KPj4gICAgIHljYyBxdWFudGl6YXRpb24gcmFu
Z2U6IE4vQSAoMHgwKQ0KPj4gICAgIGhkbWkgY29udGVudCB0eXBlOiBHcmFwaGljcw0KPj4gICAg
IHBpeGVsIHJlcGVhdDogMA0KPj4gICAgIGJhciB0b3AgMCwgYm90dG9tIDAsIGxlZnQgMCwgcmln
aHQgMA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEtvcnNuZXMgPGprb3JzbmVzQGNpc2Nv
LmNvbT4NCj4+IENjOiBIYW5zIFZlcmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNvbT4NCj4+IENjOiBN
YXJ0aW4gQnVnZ2UgPG1hcmJ1Z2dlQGNpc2NvLmNvbT4NCj4+DQo+PiAtLS0NCj4+IHYxIC0+IHYy
Og0KPj4gICogSW5kaWNhdGUgYXBwbGljYWJpbGl0eSBub3Qgb25seSBmb3IgZXh0LiBjb2xvcmlt
ZXRyeQ0KPj4gLS0tDQo+PiAgZHJpdmVycy92aWRlby9oZG1pLmMgfCA0MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9oZG1pLmMNCj4+IGluZGV4IDljODJlMmEwYTQxMS4u
NDkxYTc3YjI4YTliIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9oZG1pLmMNCj4+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jDQo+PiBAQCAtMTIwOSwxNiArMTIwOSw0MCBAQCBzdGF0
aWMgdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLA0KPj4gIAlo
ZG1pX2xvZygiICAgIGFjdGl2ZSBhc3BlY3Q6ICVzXG4iLA0KPj4gIAkJCWhkbWlfYWN0aXZlX2Fz
cGVjdF9nZXRfbmFtZShmcmFtZS0+YWN0aXZlX2FzcGVjdCkpOw0KPj4gIAloZG1pX2xvZygiICAg
IGl0YzogJXNcbiIsIGZyYW1lLT5pdGMgPyAiSVQgQ29udGVudCIgOiAiTm8gRGF0YSIpOw0KPj4g
LQloZG1pX2xvZygiICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5OiAlc1xuIiwNCj4+IC0JCQloZG1p
X2V4dGVuZGVkX2NvbG9yaW1ldHJ5X2dldF9uYW1lKGZyYW1lLT5leHRlbmRlZF9jb2xvcmltZXRy
eSkpOw0KPj4gLQloZG1pX2xvZygiICAgIHF1YW50aXphdGlvbiByYW5nZTogJXNcbiIsDQo+PiAt
CQkJaGRtaV9xdWFudGl6YXRpb25fcmFuZ2VfZ2V0X25hbWUoZnJhbWUtPnF1YW50aXphdGlvbl9y
YW5nZSkpOw0KPj4gKw0KPj4gKwlpZiAoZnJhbWUtPmNvbG9yaW1ldHJ5ID09IEhETUlfQ09MT1JJ
TUVUUllfRVhURU5ERUQpDQo+PiArCQloZG1pX2xvZygiICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5
OiAlc1xuIiwNCj4+ICsJCQkgaGRtaV9leHRlbmRlZF9jb2xvcmltZXRyeV9nZXRfbmFtZShmcmFt
ZS0+ZXh0ZW5kZWRfY29sb3JpbWV0cnkpKTsNCj4+ICsJZWxzZQ0KPj4gKwkJaGRtaV9sb2coIiAg
ICBleHRlbmRlZCBjb2xvcmltZXRyeTogTi9BICgweCV4KVxuIiwNCj4+ICsJCQkgZnJhbWUtPmV4
dGVuZGVkX2NvbG9yaW1ldHJ5KTsNCj4+ICsNCj4+ICsJaWYgKGZyYW1lLT5jb2xvcnNwYWNlID09
IEhETUlfQ09MT1JTUEFDRV9SR0IpDQo+PiArCQloZG1pX2xvZygiICAgIHF1YW50aXphdGlvbiBy
YW5nZTogJXNcbiIsDQo+PiArCQkJIGhkbWlfcXVhbnRpemF0aW9uX3JhbmdlX2dldF9uYW1lKGZy
YW1lLT5xdWFudGl6YXRpb25fcmFuZ2UpKTsNCj4+ICsJZWxzZQ0KPj4gKwkJaGRtaV9sb2coIiAg
ICBxdWFudGl6YXRpb24gcmFuZ2U6IE4vQSAoMHgleClcbiIsDQo+PiArCQkJIGZyYW1lLT5xdWFu
dGl6YXRpb25fcmFuZ2UpOw0KPj4gKw0KPj4gIAloZG1pX2xvZygiICAgIG51cHM6ICVzXG4iLCBo
ZG1pX251cHNfZ2V0X25hbWUoZnJhbWUtPm51cHMpKTsNCj4+ICAJaGRtaV9sb2coIiAgICB2aWRl
byBjb2RlOiAldVxuIiwgZnJhbWUtPnZpZGVvX2NvZGUpOw0KPj4gLQloZG1pX2xvZygiICAgIHlj
YyBxdWFudGl6YXRpb24gcmFuZ2U6ICVzXG4iLA0KPj4gLQkJCWhkbWlfeWNjX3F1YW50aXphdGlv
bl9yYW5nZV9nZXRfbmFtZShmcmFtZS0+eWNjX3F1YW50aXphdGlvbl9yYW5nZSkpOw0KPj4gLQlo
ZG1pX2xvZygiICAgIGhkbWkgY29udGVudCB0eXBlOiAlc1xuIiwNCj4+IC0JCQloZG1pX2NvbnRl
bnRfdHlwZV9nZXRfbmFtZShmcmFtZS0+Y29udGVudF90eXBlKSk7DQo+PiArDQo+PiArCWlmIChm
cmFtZS0+Y29sb3JzcGFjZSA9PSBIRE1JX0NPTE9SU1BBQ0VfWVVWNDIyIHx8DQo+PiArCSAgICBm
cmFtZS0+Y29sb3JzcGFjZSA9PSBIRE1JX0NPTE9SU1BBQ0VfWVVWNDQ0IHx8DQo+PiArCSAgICBm
cmFtZS0+Y29sb3JzcGFjZSA9PSBIRE1JX0NPTE9SU1BBQ0VfWVVWNDIwKQ0KPiANCj4gb2NkIG5p
dDogb3JkZXIgNDQ0fHw0MjJ8fDQyMCBvciA0MjB8fDQyMnx8NDQ0DQo+IA0KDQpTaG91bGQgSSBz
ZW5kIGEgdjMgd2l0aCB5b3VyIFJldmlld2VkLWJ5IHRhZyBhZGRlZCBhZnRlciBmaXhpbmcgdGhp
cz8NCg0KPj4gKwkJaGRtaV9sb2coIiAgICB5Y2MgcXVhbnRpemF0aW9uIHJhbmdlOiAlc1xuIiwN
Cj4+ICsJCQkgaGRtaV95Y2NfcXVhbnRpemF0aW9uX3JhbmdlX2dldF9uYW1lKGZyYW1lLT55Y2Nf
cXVhbnRpemF0aW9uX3JhbmdlKSk7DQo+PiArCWVsc2UNCj4+ICsJCWhkbWlfbG9nKCIgICAgeWNj
IHF1YW50aXphdGlvbiByYW5nZTogTi9BICgweCV4KVxuIiwNCj4+ICsJCQkgZnJhbWUtPnljY19x
dWFudGl6YXRpb25fcmFuZ2UpOw0KPiANCj4gQ1RBLTg2MS1HIGRvZXMgcmVjb21tZW5kIHRoYXQg
d2Ugc2V0IFlRIHRvIG1hdGNoIFEgd2hlbiB0cmFzbWl0dGluZw0KPiBSR0IuIFNvIG5vdCBzdXJl
ICJOL0EiIGlzIGVudGlyZWx5IGFjY3VyYXRlIGhlcmUuIEhvd2V2ZXIgd2UgYWxzbw0KPiBmb3Vu
ZCBvdXQgdGhhdCBmb2xsb3dpbmcgdGhhdCByZWNvbW1lbmRhdGlvbiBkaWQgYnJlYWsgc29tZSBj
cmFwcHkNCj4gc2lua3Mgd2hpY2ggZ2V0IGNvbmZ1c2VkIHdoZW4gdGhleSBzZWUgUkdCICsgWVEh
PTAuIFNvIG5vdyB3ZSBmb2xsb3cNCj4gdGhhdCByZWNvbW1lbmRhdGlvbiBvbmx5IGZvciBIRE1J
IDIuMCsgc2lua3MuIEFueXdheXMsIGFzIGxvbmcgYXMgdGhlDQo+IHJhdyB2YWx1ZSBpcyBwcmVz
ZW50IEkgZ3Vlc3Mgd2UgY2FuIHN0aWwgc3BvdCBzdWNoIGNhc2VzIGZyb20gdGhlIGxvZ3MuDQo+
IA0KDQpHb29kIG9ic2VydmF0aW9uLiBJIGRvbid0IGhhdmUgYW55IHN0cm9uZyBvcGluaW9uIGFi
b3V0IHRoaXMsIHNvIHVubGVzcw0KeW91IGhhdmUgYW55IG9iamVjdGlvbnMgSSB3b24ndCBjaGFu
Z2UgdGhpcyBpbiB2My4NCg0KSm9oYW4NCg0KPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+PiArDQo+PiArCWlmIChmcmFt
ZS0+aXRjKQ0KPj4gKwkJaGRtaV9sb2coIiAgICBoZG1pIGNvbnRlbnQgdHlwZTogJXNcbiIsDQo+
PiArCQkJIGhkbWlfY29udGVudF90eXBlX2dldF9uYW1lKGZyYW1lLT5jb250ZW50X3R5cGUpKTsN
Cj4+ICsJZWxzZQ0KPj4gKwkJaGRtaV9sb2coIiAgICBoZG1pIGNvbnRlbnQgdHlwZTogTi9BICgw
eCV4KVxuIiwNCj4+ICsJCQkgZnJhbWUtPmNvbnRlbnRfdHlwZSk7DQo+PiArDQo+PiAgCWhkbWlf
bG9nKCIgICAgcGl4ZWwgcmVwZWF0OiAldVxuIiwgZnJhbWUtPnBpeGVsX3JlcGVhdCk7DQo+PiAg
CWhkbWlfbG9nKCIgICAgYmFyIHRvcCAldSwgYm90dG9tICV1LCBsZWZ0ICV1LCByaWdodCAldVxu
IiwNCj4+ICAJCQlmcmFtZS0+dG9wX2JhciwgZnJhbWUtPmJvdHRvbV9iYXIsDQo+PiAtLSANCj4+
IDIuMjMuMA0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
