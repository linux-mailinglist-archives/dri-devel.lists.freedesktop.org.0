Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B41D10A9
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC4289D89;
	Wed, 13 May 2020 11:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401E089D89;
 Wed, 13 May 2020 11:08:42 +0000 (UTC)
IronPort-SDR: Chn0PXEb4qzZZL0Jw0phgSBw974qFKS7IAR9T3gPI6R2DWfkgHIUdITvkjglzhiuNd51ISsd8M
 SLWSpfOQldUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 04:08:41 -0700
IronPort-SDR: 4A+8wOa7msJXQA5ANsBnEy0aNOvPPSxCaPfAN8wJUIupoOiXUY6mz/CgKtFgPunw+P+LXAXjwl
 tNh6mzYWWrtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="409654833"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 04:08:41 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 04:08:41 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 04:08:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 13 May 2020 04:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwHn1DGk2j+8r9h8BNo07LQtBfQPcxZJlJGmZUCORilTzH5R5QXFc3mRMu7pL8zgYkIQwiC+CK4Jyyxo97sSAgIoyI297n4Nv2PE5xsNJ6SuhEauR5WKYvpp6U0qVXsDeai33CXb6Xk0+Mlb1u4Ha+NnhX7QL++/xoqYzagCfGZ/QDS8tvM2PrsanuCguZLn41t9E/lKqa+FuQWDsBfuERBcej+fEeS1m6xz9Bus9EXV+5eoi4EaCyU9oEOv2Ab55QtwTr2NlVLI8J89fFt+CynTMEyJSRyPmWRUbOOlrV9ZKDDnuhq6vYFffyrODsotHKFZORMrLlFLYFpgSV1f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srn2vGW2MJBOJuoX9s2H1TvDvv7IZ49E4g5SMi3db5o=;
 b=av7WI6mNMyY2jX4DhzKoQgjRbwa84H0JxUmpRQYfC0pALemFvtcuYYPwQoulsVHLHCPkLX3WrJZ3o6UKDtXeHMXFCCCI5KmKaxzHkL9SSawzrfE0PFQFw8qa7V5QcEpmf1v1a8aC41nwgnxsk076cIy/UKABvP+oqJnWTeIRbTSl8r6BNxf2ZUDGXN7IQb1nV0SjAJGs2Z8cdyUiv7yL+BJ23S13vC2nDj9fAV80WfO06Qjvhm0GaJBpgqcwB7eaVvSSt0zENhLJ883NnYiRXpKUTwtBwDGz2+k14yVplCTwUJ6t84EU/EbdJLaMdw49uxQAq5X/sLm+XQYyN2ceqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srn2vGW2MJBOJuoX9s2H1TvDvv7IZ49E4g5SMi3db5o=;
 b=TiAucHK35sjHhyNjmRvmoTkWowsNrw1c6wW55kGuR6YtlRQs19G6cskdE4B3imG/mVlxVRBGHVGWYfE9OReJkmrDORsBoAnDasjS61ktkDk9qo6KoPjknVv9kMS7t+LZ/jR6aN8ymqqMYfbGnkbq7t8DCkV+7ky/85VP2NsYJwM=
Received: from SN6PR11MB3327.namprd11.prod.outlook.com (2603:10b6:805:bd::13)
 by SN6PR11MB2623.namprd11.prod.outlook.com (2603:10b6:805:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29; Wed, 13 May
 2020 11:08:39 +0000
Received: from SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::357a:4125:2ff7:4e1a]) by SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::357a:4125:2ff7:4e1a%6]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 11:08:39 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Thread-Topic: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Thread-Index: AQHWKOgh1IU8BKI2YEmuDk1U0lyyz6il2PqA
Date: Wed, 13 May 2020 11:08:38 +0000
Message-ID: <SN6PR11MB3327309E56F7C172263CFE088DBF0@SN6PR11MB3327.namprd11.prod.outlook.com>
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
x-originating-ip: [192.55.79.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b951f52-0436-4e37-599e-08d7f72dfd45
x-ms-traffictypediagnostic: SN6PR11MB2623:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB262370AE2B48D6B8BD97E8678DBF0@SN6PR11MB2623.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zj201I3dgpL7eyK1yI4sYow/24t8dkIyXFWXGRyTMAPdLV4bwv+Zl1/5lvD1ShVYnJys5A+hvCw3S33cPhQSptoi7R9XyzCgsdOEAPvpDbDqYEFAzlUPZwkxHC8kJdooQ3g+rriopZmO5tEkTsaXrqIRx0RDImU3YHQDc+GiMBd6aYuR2JkdW6KNraKLMtCdDYtd2G/K2IXVSdnoG7UonbMaC1WqTTtNU/Eby+lJAe/JGNTGS4AKdL2rAoMR4YfjcLgLAG9OIZKkOEFeApyQwV78SH8mGfyOjpLukTrWFWGNuAsJfA91r5aRH1qnmfmrpq/v00ac5dmXpcccS/CmBIIqh1V0jRkqUZj0pD/Fwi2KCmbGngeDC1rhvk2+/GKNY007JxeNK8kR86vHB+y8S5FDI1qXJpPMcUW8UUuwhc/+gACZaMk4V3H7XLhNnxBSs/XIRD0DDmJyVNqe6C442rglal2i8thmjYUxY/uUJ67LWwtp1P2/9s6+mA5cxbSTEqY+5qzFd6ljcEKntXaqCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3327.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(39860400002)(136003)(366004)(346002)(33430700001)(7696005)(316002)(478600001)(33656002)(71200400001)(26005)(4326008)(53546011)(86362001)(66476007)(6506007)(5660300002)(64756008)(8936002)(33440700001)(76116006)(66556008)(52536014)(66446008)(2906002)(110136005)(55016002)(54906003)(186003)(66574014)(8676002)(9686003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XZTemv5jpENrVo5DreduZb51DLwZ0tkdjS2Z81KWiffn0Q1DXTwUxUatuvSHeYyPbTS5WXTl4x+GawA55IGwciZBCzxFaePmtFKutugSqRZi9hLnE3mZ4WTzJcpGWlK9u+GtC1/yzPVYqWgFttpS8KxFoVMidkw5AsjCRX7B7n31EB9qtb6DnRqiOzOgucPFWcM6zkN6bW/+w8/Fq4N5YEUDm5JR52uRte3zZD17eTSYz5qak8Q2FC7eEkK2EswFUrqN9IUIdwcT6+Oe+kgyTgo8/II5dtMzq7KRsnWLGjgR+zZdXyVRgjGYJ7XKi3eAWC1b1nRK3JVLms8+Canbtmxn+QWWC/vqPo+nRJBkWHV0rP8jW1UiKtthcgEsK45slt9uzkyhmRG+Vs9JQf4Axa0LsexMOzmrKWx/dp2hZOg9BqS5tWoTC7GoY2dLtq0/DpZoQG2bJIHJJw2NU2tqhGXT2ZTe9ECclBtSndKK0C8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b951f52-0436-4e37-599e-08d7f72dfd45
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 11:08:38.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNpktJcRQ4iGgsYoVhNDyDZW0K9Ge2m8ldq5Mmvvo3hFYvz6PBJLNZiJtOqtGAr+iRb4+4xd7JeIqGoleFzs8UagC+EcjpB24jT6PXvHXbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2623
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE5hdmFyZSwgTWFuYXNpIEQgPG1hbmFz
aS5kLm5hdmFyZUBpbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXkgMTMsIDIwMjAgMTE6
MDUgQU0NClRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTW9kZW0sIEJoYW51cHJha2FzaCA8YmhhbnVwcmFrYXNo
Lm1vZGVtQGludGVsLmNvbT47IE5hdmFyZSwgTWFuYXNpIEQgPG1hbmFzaS5kLm5hdmFyZUBpbnRl
bC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRD
SCB2NSAzLzNdIGRybS9pOTE1L2RwOiBFeHBvc2UgY29ubmVjdG9yIFZSUiBpbmZvIHZpYSBkZWJ1
Z2ZzDQoNCkZyb206IEJoYW51cHJha2FzaCBNb2RlbSA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVs
LmNvbT4NCg0KW1doeV0NCkl0J3MgdXNlZnVsIHRvIGtub3cgdGhlIG1pbiBhbmQgbWF4IHZyciBy
YW5nZSBmb3IgSUdUIHRlc3RpbmcuDQoNCltIb3ddDQpFeHBvc2UgdGhlIG1pbiBhbmQgbWF4IHZm
cmVxIGZvciB0aGUgY29ubmVjdG9yIHZpYSBhIGRlYnVnZnMgZmlsZSBvbiB0aGUgY29ubmVjdG9y
LCAiaTkxNV92cnJfaW5mbyIuDQoNCkV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9kcmkvMC9EUC0xL2k5MTVfdnJyX2luZm8NCg0KW0JoYW51XTogQ2FuIHlvdSBwbGVhc2UgZml4
IHRoZSBjb21taXQgbWVzc2FnZT8gJ3MvaTkxNV92cnJfaW5mby92cnJfcmFuZ2UvJw0KDQp2NToN
CiogUmVuYW1lIHRvIHZycl9yYW5nZSB0byBtYXRjaCBBTUQgZGVidWdmcw0KdjQ6DQoqIFJlYmFz
ZQ0KdjM6DQoqIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgZGVidWcgcHJpbnQgKE1hbmFzaSkNCnYy
Og0KKiBGaXggdGhlIHR5cG8gaW4gbWF4X3ZmcmVxIChNYW5hc2kpDQoqIENoYW5nZSB0aGUgbmFt
ZSBvZiBub2RlIHRvIGk5MTVfdnJyX2luZm8gc28gd2UgY2FuIGFkZCBvdGhlciB2cnIgaW5mbyBm
b3IgbW9yZSBkZWJ1ZyBpbmZvIChNYW5hc2kpDQoqIENoYW5nZSB0aGUgVlJSIGNhcGFibGUgdG8g
ZGlzcGxheSBZZXMgb3IgTm8gKE1hbmFzaSkNCiogRml4IGluZGVudGF0aW9uIGNoZWNrcGF0Y2gg
ZXJyb3JzIChNYW5hc2kpDQoNClNpZ25lZC1vZmYtYnk6IEJoYW51cHJha2FzaCBNb2RlbSA8Ymhh
bnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1hbmFzaSBOYXZhcmUg
PG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+DQpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4NCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KVGVzdGVkLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVA
aW50ZWwuY29tPg0KLS0tDQogLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1
Z2ZzLmMgIHwgMjIgKysrKysrKysrKysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KaW5kZXggNzA1MjU2MjNiY2RmLi5h
MGQ2ODBjMTNlMGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfZGVidWdmcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQpAQCAtMjE4NSw2ICsyMTg1LDIxIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGk5MTVfZHNjX2ZlY19zdXBwb3J0X2ZvcHMgPSB7
DQogCS53cml0ZSA9IGk5MTVfZHNjX2ZlY19zdXBwb3J0X3dyaXRlDQogfTsNCiANCitzdGF0aWMg
aW50IHZycl9yYW5nZV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkgew0KKwlz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gbS0+cHJpdmF0ZTsNCisNCisJaWYgKGNv
bm5lY3Rvci0+c3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKQ0KKwkJcmV0dXJu
IC1FTk9ERVY7DQorDQorCXNlcV9wcmludGYobSwgIlZycl9jYXBhYmxlOiAlc1xuIiwgeWVzbm8o
aW50ZWxfZHBfaXNfdnJyX2NhcGFibGUoY29ubmVjdG9yKSkpOw0KW0JoYW51XTogQXMgd2UgY2Fu
IHJlYWQgInZycl9jYXBhYmxlIiBwcm9wZXJ0eSBmcm9tIERSTV9JT0NUTF9NT0RFX09CSl9HRVRQ
Uk9QRVJUSUVTIGlvY3RsLCBJIHRoaW5rIHdlIGRvbid0IG5lZWQgdG8gZXhwb3NlICJ2cnJfY2Fw
YWJsZSIgdGhyb3VnaCBkZWJ1Z2ZzLg0KKwlzZXFfcHJpbnRmKG0sICJNaW46ICV1XG4iLCAodTgp
Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8ubW9uaXRvcl9yYW5nZS5taW5fdmZyZXEpOw0KKwlzZXFf
cHJpbnRmKG0sICJNYXg6ICV1XG4iLCANCisodTgpY29ubmVjdG9yLT5kaXNwbGF5X2luZm8ubW9u
aXRvcl9yYW5nZS5tYXhfdmZyZXEpOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorREVGSU5FX1NIT1df
QVRUUklCVVRFKHZycl9yYW5nZSk7DQorDQogLyoqDQogICogaW50ZWxfY29ubmVjdG9yX2RlYnVn
ZnNfYWRkIC0gYWRkIGk5MTUgc3BlY2lmaWMgY29ubmVjdG9yIGRlYnVnZnMgZmlsZXMNCiAgKiBA
Y29ubmVjdG9yOiBwb2ludGVyIHRvIGEgcmVnaXN0ZXJlZCBkcm1fY29ubmVjdG9yIEBAIC0yMjE5
LDEwICsyMjM0LDE1IEBAIGludCBpbnRlbF9jb25uZWN0b3JfZGVidWdmc19hZGQoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCiANCiAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0g
MTAgJiYNCiAJICAgIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5F
Q1RPUl9EaXNwbGF5UG9ydCB8fA0KLQkgICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0g
RFJNX01PREVfQ09OTkVDVE9SX2VEUCkpDQorCSAgICAgY29ubmVjdG9yLT5jb25uZWN0b3JfdHlw
ZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSkgew0KIAkJZGVidWdmc19jcmVhdGVfZmlsZSgi
aTkxNV9kc2NfZmVjX3N1cHBvcnQiLCBTX0lSVUdPLCByb290LA0KIAkJCQkgICAgY29ubmVjdG9y
LCAmaTkxNV9kc2NfZmVjX3N1cHBvcnRfZm9wcyk7DQogDQorCQlpZiAoSU5URUxfR0VOKGRldl9w
cml2KSA+PSAxMikNCisJCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ2cnJfcmFuZ2UiLCBTX0lSVUdP
LA0KKwkJCQkJICAgIHJvb3QsIGNvbm5lY3RvciwgJnZycl9yYW5nZV9mb3BzKTsNCisJfQ0KKw0K
IAkvKiBMZWdhY3kgcGFuZWxzIGRvZXNuJ3QgbHBzcCBvbiBhbnkgcGxhdGZvcm0gKi8NCiAJaWYg
KChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDkgfHwgSVNfSEFTV0VMTChkZXZfcHJpdikgfHwNCiAJ
ICAgICBJU19CUk9BRFdFTEwoZGV2X3ByaXYpKSAmJg0KLS0NCjIuMTkuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
