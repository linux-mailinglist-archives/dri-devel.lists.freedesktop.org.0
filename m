Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992C10E457
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 02:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6489DA3;
	Mon,  2 Dec 2019 01:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B1789DA3;
 Mon,  2 Dec 2019 01:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIhLKNgE8ccgmvP94HzvnoSIIC12Vz9KNK2OeZzxly6MpaFHcRs5wZxep0JTy2PaJ9nFjNKxvv0HTYLc1CzOpaqdczJemZppUUM4YH9o4ziA+EKaSs5fWvZ5LrcoHpC3MAb1Bg+tdIS5MD74ijUmUGUZyaRDUWY7f+rep0PDsR/71eKUtAyaYISHlyp2VBFGt7sHVZTh1apsSc3dTi6P3NfG0i5nVVmcmByPuRkZgNehyCumgTiB823Zxbq66LVvlrx7fkBRx/eaiZP6ttKOhuDXG1Zrs1L5t9zDHH36DxIegQkPQwFZ1gG3cj1SBcU8+JLt1edzSlLqoEVGkoCOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExMV1NPYfELMRoMUw4aCXc8ilL9Ea1heb03Q/5AFN6c=;
 b=FmNk8IkVzDkTZNjgWbdkEo+kan04S7I8oe75Jj5uiq4LmZ7RSo8FI5L9d9bnmIOfNPfYE6iEtVc/lD9gNQeBAPfL2T2JwxA+8rAfbIDKU+1kPiEdZO2sWArzL8bf4qL/Wo8oQ8uj9WWGmz/t0tuc/AgdTACsdx5I+HbVZ1Sq/sIbLiTvr6O+2QkmcN8lfKPivMDK3CdCHQCGl4+LwESCSyJG4gEQrZ+z7QmMJSQheod51LjEgydss0JTDL9NyIEQGKBIc7DNaU2hhYeebgvTRLfyw1PfdntLvQItuDUxDaQk4HPwyIQ/UyQTPuSgrKUDfAse+CWMjtUhRq7SOeFNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3114.namprd12.prod.outlook.com (20.178.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 01:59:25 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4%3]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 01:59:25 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH V2 1/2] drm/edid: Add aspect ratios to HDMI 4K modes
Thread-Topic: [PATCH V2 1/2] drm/edid: Add aspect ratios to HDMI 4K modes
Thread-Index: AQHVnfmXuJIPLHFZY06SmOYH902kw6eiUdaAgAPZHBA=
Date: Mon, 2 Dec 2019 01:59:25 +0000
Message-ID: <DM6PR12MB4137ED8BADF5913AF93FFD84FC430@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191118101832.15487-1-Wayne.Lin@amd.com>
 <20191129150845.GF1208@intel.com>
In-Reply-To: <20191129150845.GF1208@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4e64d1f6-ac43-4f15-1229-08d776cb4229
x-ms-traffictypediagnostic: DM6PR12MB3114:
x-microsoft-antispam-prvs: <DM6PR12MB3114448411EBF408C3DEDC3AFC430@DM6PR12MB3114.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(13464003)(199004)(189003)(51914003)(7696005)(305945005)(6306002)(9686003)(3846002)(966005)(6116002)(229853002)(446003)(11346002)(4326008)(102836004)(71190400001)(25786009)(71200400001)(14454004)(53546011)(6506007)(33656002)(26005)(8936002)(478600001)(76116006)(66946007)(99286004)(7736002)(186003)(55016002)(74316002)(5660300002)(64756008)(66556008)(66446008)(66476007)(81166006)(52536014)(81156014)(316002)(45080400002)(256004)(54906003)(86362001)(6436002)(8676002)(2906002)(6916009)(66066001)(76176011)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3114;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YwNVz7OSwA4U4eI4PSLx4Xv/67KPGNNxMcXRmZli8JBi3vVgIoF4Trb4inQVRQ4ugX/UiBdgMtNwk/3x6OLL3l737gnVNseNdfDvxITLDkug0OrBki6PjUObsunOVRZcGhwsnD4b8D7HHYJWHQZ8QeIUYgF2AMHuR9EjzMHRShboMYwGhB0mQ4XxyPFpKnle2HCeguBO3MKYGp+NSAMqhy2W+dHIG91J9XYurRYbId6ITAILYqChkoTx1ePdactq2ywumrtkhf3JfY3BcGY6ZvHBziXx49W5N0Jupn9ZN5s2+EEjh7y0/CK3rYuvIyHuHnO3qhPCeM0ONeBko1BXSoGxNgjAcvGd+kxAGeMQ7pD9TBtmNO68Ce8t8YYHSiTeWz2IonYTFwYr/Hfuh0EdNzq8BcyEiu4PkOnIsIpnZCeSd6pkLm1px1c85S/1k9Nt
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e64d1f6-ac43-4f15-1229-08d776cb4229
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 01:59:25.5346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTqEZCUhBKcxus7eHVMNptDrHUDE6FcfMzcaYBEGx43tUVCQfF2LMSuaTtrVA9GBrjAf/3eowWVTb3Xmo/FP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExMV1NPYfELMRoMUw4aCXc8ilL9Ea1heb03Q/5AFN6c=;
 b=V8Tw/UvDWxrd1AgJleqQYE4QOid2BwDcZb8kVfGab73cMU9mhH9TgkD987NkOE2fDtLiRmSYXBiC+uwLMWE7Di3vLf5KcdoE+mkCCgsyf8DljdwiatwVsi70rrZtPD1H6Jaw8ZRG3CXvPnelBUQOBUO6NJCSgyunUeV3i34cns4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI5
LCAyMDE5IDExOjA5IFBNCj4gVG86IExpbiwgV2F5bmUgPFdheW5lLkxpbkBhbWQuY29tPgo+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSBkcm0vZWRpZDogQWRkIGFzcGVj
dCByYXRpb3MgdG8gSERNSSA0SyBtb2Rlcwo+IAo+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2
OjE4OjMxUE0gKzA4MDAsIFdheW5lIExpbiB3cm90ZToKPiA+IFtXaHldCj4gPiBIRE1JIDIuMCBh
ZGRzIGFzcGVjdCByYXRpbyBhdHRyaWJ1dGUgdG8gZGlzdGluZ3Vpc2ggZGlmZmVyZW50IDRrCj4g
PiBtb2Rlcy4gQWNjb3JkaW5nIHRvIEFwcGVuZGl4IEUgb2YgSERNSSAyLjAgc3BlYywgc291cmNl
IHNob3VsZCB1c2UKPiA+IFZTSUYgdG8gaW5kaWNhdGUgdmlkZW8gbW9kZSBvbmx5IHdoZW4gdGhl
IG1vZGUgaXMgb25lIGRlZmluZWQgaW4gSERNSQo+ID4gMS40YiA0SyBtb2Rlcy4gT3RoZXJ3aXNl
LCB1c2UgQVZJIGluZm9mcmFtZXMgdG8gY29udmV5IFZJQy4KPiA+Cj4gPiBDdXJyZW50IGNvZGUg
ZG9lc24ndCB0YWtlIGFzcGVjdCByYXRpbyBpbnRvIGNvbnNpZGVyYXRpb24gd2hpbGUKPiA+IGNv
bnN0cnVjdGluZyBhdmkgaW5mb2ZyYW1lLiBTaG91bGQgbW9kaWZ5IHRoYXQuCj4gPgo+ID4gW0hv
d10KPiA+IEluaGVyaXQgVmlsbGUgU3lyasOkbMOkJ3Mgd29yawo+ID4gImRybS9lZGlkOiBQcmVw
IGZvciBIRE1JIFZJQyBhc3BlY3QgcmF0aW8iIGF0Cj4gPiBodHRwczovL25hbTExLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRjCj4gPgo+IGh3
b3JrLmtlcm5lbC5vcmclMkZwYXRjaCUyRjExMTc0NjM5JTJGJmFtcDtkYXRhPTAyJTdDMDElN0NX
YXluZS5MCj4gaW4lNDAKPiA+Cj4gYW1kLmNvbSU3QzFmYmJjOWQ2MTcyMzRhZjVmM2Q0MDhkNzc0
ZGUwYTdjJTdDM2RkODk2MWZlNDg4NGU2MDhlMQo+IDFhODJkOQo+ID4KPiA5NGUxODNkJTdDMCU3
QzAlN0M2MzcxMDYzNjkzMTUzNTIzMzQmYW1wO3NkYXRhPVFQVzlDbndnUGtsMkRJbgo+IGJ5bWZh
WVQlCj4gPiAyRjZqeGRtVmFUTUtFTU42OVZCRmNRJTNEJmFtcDtyZXNlcnZlZD0wCj4gPgo+ID4g
QWRkIHBpY3R1cmVfYXNwZWN0X3JhdGlvIGF0dHJpYnV0ZXMgdG8gZWRpZF80a19tb2Rlc1tdIGFu
ZCBjb25zdHJ1Y3QKPiA+IFZJQyBhbmQgSERNSV9WSUMgYnkgdGFraW5nIGFzcGVjdCByYXRpbyBp
bnRvIGNvbnNpZGVyYXRpb24uCj4gPgo+ID4gdjI6IENvcnJlY3QgbWlzc2luZyBpbml0aWFsaXpl
ciBlcnJvciBhdCBhZGRpbmcgYXNwZWN0IHJhdGlvIG9mIFNNUFRFCj4gPiBtb2RlLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+Cj4gCj4gT3VyIENJ
IGRpZG4ndCBjb21wbGFpbiBhYm91dCBhbnl0aGluZyB0aGF0IGxvb2tlZCByZWxldmFudCwgc28g
SSB3ZW50IGFoZWFkIGFuCj4gcHVzaGVkIHRoZXNlIHRvIGRybS1taXNjLW5leHQuCj4gCj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2hlcy4KCk1hbnkgdGhhbmtzIGZvciB5b3VyIHRpbWUuCj4gCj4gLS0K
PiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAoKLS0KUmVnYXJkcywKV2F5bmUgTGluCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
