Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43C1D2585
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 05:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E196E137;
	Thu, 14 May 2020 03:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CFC6E137;
 Thu, 14 May 2020 03:42:17 +0000 (UTC)
IronPort-SDR: u260oyHAxG2ZknGVQvCFhPL3fmSdoL5iLa8eaCMGIRQiLT48Y3rhI9ZWZokXc2srvJGtVTyrbe
 J8RxRh6cUKbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 20:42:17 -0700
IronPort-SDR: KFV5/nB2R/JSG4dlcBfKxYjO70H2kFvD/kIxZ6uDNU8BlaRxPaTsxLskTkyexp3FVoEiy8qZf5
 Fn2WeLijGAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="297881912"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 13 May 2020 20:42:17 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 20:42:17 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 20:42:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 13 May 2020 20:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYZmSIYaJBfi0lbW9IhSpZQYQx8bu6Bpd0FBGXU+ih1CW2ryMPj74o2Y9fs5MdNo18oQwC/1Wh85NhX1qZx8uBV1DgFsIZ9fho4pCwIzlhhitlHbhHT4qEZkHxm0fhKd6NHRa7bz2rJQUjoskIGDL7h5d+klhpDKmM9N0l0ghTwY7XCEDa9FqjO/ZsqLwPlIc/pwjeugnRGDsheEgBda8AdKr5aV5mgJcFDaNLGnFtU5ba4adKQsaxvQvXL/OTUtKuP7wt3wRfW+4TrI63PJLVhb3+6D84BL2SaJsagpE/S4G0fcknvJHXF/Ye7vwd7Ofz3iU+123nFQQcAnu7fp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHCyAT+qb+jvLeLEO76RWvuW/ov992VtF1r5CS1TE5M=;
 b=VYKv7lzzYjYnJVxSOWqvLn/SuINACDWx6rntpI3BhHsURcX0ZM/tzq+ajJEAJN2WH9VjgN1l16l7a10jxp3eTeiMncUWR0mufak6y3msU5HhhQ+bJlq1CKwQTPsQbYgk+P6ec9B1/Ti+r6c+B6yOeNKZtA9N2uhhpo/vLGv5AQv7R67XWXylZts+csTMJe/P/xz2P4nzuakDDBkDTNsCJ/QoB5CwOvXkXyDypr3e9cu6FNv4j6rEZ04EvlvTcRZerlZ+1cbf9YVEa3VqV01Tgkqw0cxY6onn65y85cwJQC2joq8iYC6J4tMQbSujesyMY1uOn53lla+nV2AV5y0IUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHCyAT+qb+jvLeLEO76RWvuW/ov992VtF1r5CS1TE5M=;
 b=FkfX7HRsERYfkHO86fNQmBoAwzOATDu7M/nQSdXC/dqLgP5zCUfYVuNlip23GWyJ4T2kIwGrsp3+TWq/qk9jzg/8gZB/lpnAgRsrzWfYqKTe1M06eXXNvgJOvp40tGXv1GJv7qa2pY4cLeojKfytBykFWNMDxDQANtH4nrI9yxs=
Received: from SN6PR11MB3327.namprd11.prod.outlook.com (2603:10b6:805:bd::13)
 by SN6PR11MB2576.namprd11.prod.outlook.com (2603:10b6:805:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 03:42:15 +0000
Received: from SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::357a:4125:2ff7:4e1a]) by SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::357a:4125:2ff7:4e1a%6]) with mapi id 15.20.2979.033; Thu, 14 May 2020
 03:42:15 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Thread-Topic: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Thread-Index: AQHWKOgh1IU8BKI2YEmuDk1U0lyyz6im8MZA
Date: Thu, 14 May 2020 03:42:14 +0000
Message-ID: <SN6PR11MB3327A44B690A977DF22AEF0F8DBC0@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20200513053431.2138-1-manasi.d.navare@intel.com>
 <20200513053431.2138-3-manasi.d.navare@intel.com>
In-Reply-To: <20200513053431.2138-3-manasi.d.navare@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.79.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d607dd7a-2294-4995-aa75-08d7f7b8cb28
x-ms-traffictypediagnostic: SN6PR11MB2576:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB257618EECAFCD8BB781419F28DBC0@SN6PR11MB2576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zuf+zWPGCnETKGqjVoc7cQpcqreW+lcFXQPN98qom+K9oaevFQEKShuvQiN3L4Pa80AKGbhdV5weIBp4+oFalIG3JKL8E0/p+oyqTtuaXX8i8qZ7T5ltXgh7+u7kY4JmdFo/ynulLa+Z0ZCO60db1gUUW5/rz/8uybJOXo6IAqm/TzosZtfdzhnqF5biBjjMr8y+m3KqLCjhMAW7uCK8c6FKBHAAu2R6I8ciw2G3MvHQbj/mUyzBljcsVNv8FHjHHm+5e7Btcqt8pbaM7ylOpZZkCd4f3sIvo8B2CKvR+wej0NH++CIME7IHW5FWm65qTEMfMRyp68FB+YGu73lgZx8XnMXJ4xNrWyMo5VrM9ly+/ykug4+C2gnV7BLKNNdKjLOR9IHAmfYlcAk1Rp29N+COm6MPwLIDXv6F2dhlEw3Zw1dZDtdPSWcnZ3Cv4H0j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3327.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(2906002)(66446008)(55016002)(71200400001)(8936002)(478600001)(9686003)(66574014)(8676002)(54906003)(4326008)(33656002)(86362001)(316002)(5660300002)(66476007)(64756008)(66556008)(26005)(186003)(6506007)(66946007)(7696005)(76116006)(52536014)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vKM/CS74uUyNCFQPyIx6kl4c3EMHC4SeATKIV3seyzmRBU7BYR26IZMlpQaA5fzOnbBggNpagLswshnQ3suf95UPqFmzjBnb6ePuwk1/NH0KdeOeurnE7P9FE4HCAC4lbYMvaCZvIMj97fhy3vEU3TPUYI5mceMXDbKW+ANVIRHK5JnxqYrpmnsIyQQyhHPhLRW4vSX1s+7JoHMn/yIIG2fK1BXbOYJpEC9gUmXu1/DaZw6eEniDYiGKS0Eqe+pIJwzAa3Vk3OqL/SxTLONQJvVzuLuRSdXAWhJmv+8/IzmCyHX0+fpaNE8d68LdpyQvIiVAyA5FAeNDrRFW477aBWWvCG4onTTpmhOQGY1nIpO3H/iMyvQCom2MO1PbcIPLKGT3HIv1DzSyLJlTTmXYkDwA7DL+sRbgkdi0LvxlZEmclg7cAKV8dXippqyXxFrTEucg3OetbtWsdR6baND9KpA3KkkQ4lNgJ8oAMwGAhQI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d607dd7a-2294-4995-aa75-08d7f7b8cb28
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 03:42:14.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIpsI1Py0wjK+kSgII1pp2h3aH5/0v35gFnfpXW6ofaMEGrNX3344ABoyf8rLSQ2OPRyYjbaGWiiO8HwYdpzrpExnsZSkdu0bNlRGbSy1PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2576
X-OriginatorOrg: intel.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0NCkl0J3MgdXNlZnVsIHRvIGtub3cgdGhlIG1pbiBhbmQgbWF4IHZyciByYW5nZSBmb3Ig
SUdUIHRlc3RpbmcuDQoNCltIb3ddDQpFeHBvc2UgdGhlIG1pbiBhbmQgbWF4IHZmcmVxIGZvciB0
aGUgY29ubmVjdG9yIHZpYSBhIGRlYnVnZnMgZmlsZSBvbiB0aGUgY29ubmVjdG9yLCAidnJyX3Jh
bmdlIi4NCg0KRXhhbXBsZSB1c2FnZTogY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEv
dnJyX3JhbmdlDQoNCnY1Og0KKiBSZW5hbWUgdG8gdnJyX3JhbmdlIHRvIG1hdGNoIEFNRCBkZWJ1
Z2ZzDQp2NDoNCiogUmViYXNlDQp2MzoNCiogUmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBkZWJ1ZyBw
cmludCAoTWFuYXNpKQ0KdjI6DQoqIEZpeCB0aGUgdHlwbyBpbiBtYXhfdmZyZXEgKE1hbmFzaSkN
CiogQ2hhbmdlIHRoZSBuYW1lIG9mIG5vZGUgdG8gaTkxNV92cnJfaW5mbyBzbyB3ZSBjYW4gYWRk
IG90aGVyIHZyciBpbmZvIGZvciBtb3JlIGRlYnVnIGluZm8gKE1hbmFzaSkNCiogQ2hhbmdlIHRo
ZSBWUlIgY2FwYWJsZSB0byBkaXNwbGF5IFllcyBvciBObyAoTWFuYXNpKQ0KKiBGaXggaW5kZW50
YXRpb24gY2hlY2twYXRjaCBlcnJvcnMgKE1hbmFzaSkNCg0KU2lnbmVkLW9mZi1ieTogQmhhbnVw
cmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1i
eTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4NCkNjOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQpUZXN0ZWQtYnk6IE1hbmFzaSBOYXZhcmUg
PG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+DQotLS0NCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X2RlYnVnZnMuYyAgfCAyMiArKysrKysrKysrKysrKysrKystDQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQppbmRl
eCA3MDUyNTYyM2JjZGYuLmEwZDY4MGMxM2UwZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCkBAIC0yMTg1LDYgKzIx
ODUsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgaTkxNV9kc2NfZmVj
X3N1cHBvcnRfZm9wcyA9IHsNCiAJLndyaXRlID0gaTkxNV9kc2NfZmVjX3N1cHBvcnRfd3JpdGUN
CiB9Ow0KIA0KK3N0YXRpYyBpbnQgdnJyX3JhbmdlX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2
b2lkICpkYXRhKSB7DQorCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2
YXRlOw0KKw0KKwlpZiAoY29ubmVjdG9yLT5zdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25u
ZWN0ZWQpDQorCQlyZXR1cm4gLUVOT0RFVjsNCisNCisJc2VxX3ByaW50ZihtLCAiVnJyX2NhcGFi
bGU6ICVzXG4iLCB5ZXNubyhpbnRlbF9kcF9pc192cnJfY2FwYWJsZShjb25uZWN0b3IpKSk7DQor
CXNlcV9wcmludGYobSwgIk1pbjogJXVcbiIsICh1OCljb25uZWN0b3ItPmRpc3BsYXlfaW5mby5t
b25pdG9yX3JhbmdlLm1pbl92ZnJlcSk7DQorCXNlcV9wcmludGYobSwgIk1heDogJXVcbiIsIA0K
Kyh1OCljb25uZWN0b3ItPmRpc3BsYXlfaW5mby5tb25pdG9yX3JhbmdlLm1heF92ZnJlcSk7DQor
DQorCXJldHVybiAwOw0KK30NCitERUZJTkVfU0hPV19BVFRSSUJVVEUodnJyX3JhbmdlKTsNCisN
CiAvKioNCiAgKiBpbnRlbF9jb25uZWN0b3JfZGVidWdmc19hZGQgLSBhZGQgaTkxNSBzcGVjaWZp
YyBjb25uZWN0b3IgZGVidWdmcyBmaWxlcw0KICAqIEBjb25uZWN0b3I6IHBvaW50ZXIgdG8gYSBy
ZWdpc3RlcmVkIGRybV9jb25uZWN0b3IgQEAgLTIyMTksMTAgKzIyMzQsMTUgQEAgaW50IGludGVs
X2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0K
IA0KIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCAmJg0KIAkgICAgKGNvbm5lY3Rvci0+
Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8DQotCSAg
ICAgY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSkN
CisJICAgICBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9l
RFApKSB7DQogCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJpOTE1X2RzY19mZWNfc3VwcG9ydCIsIFNf
SVJVR08sIHJvb3QsDQogCQkJCSAgICBjb25uZWN0b3IsICZpOTE1X2RzY19mZWNfc3VwcG9ydF9m
b3BzKTsNCiANCisJCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEyKQ0KKwkJCWRlYnVnZnNf
Y3JlYXRlX2ZpbGUoInZycl9yYW5nZSIsIFNfSVJVR08sDQorCQkJCQkgICAgcm9vdCwgY29ubmVj
dG9yLCAmdnJyX3JhbmdlX2ZvcHMpOw0KKwl9DQorDQogCS8qIExlZ2FjeSBwYW5lbHMgZG9lc24n
dCBscHNwIG9uIGFueSBwbGF0Zm9ybSAqLw0KIAlpZiAoKElOVEVMX0dFTihkZXZfcHJpdikgPj0g
OSB8fCBJU19IQVNXRUxMKGRldl9wcml2KSB8fA0KIAkgICAgIElTX0JST0FEV0VMTChkZXZfcHJp
dikpICYmDQotLQ0KMi4xOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
