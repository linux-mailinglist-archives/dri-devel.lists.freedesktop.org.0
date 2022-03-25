Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296BF4E7454
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F1110EA36;
	Fri, 25 Mar 2022 13:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BEC10EA36;
 Fri, 25 Mar 2022 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648215683; x=1648820483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XlSfTqWKHd1R4grbY4wZrWiYnKPZYPM5Hs0Sz684bOM=;
 b=uUAQmiUEQtvTSHdFQr+Rohm8HGAW5QZ3t9RnybLdQBHzGvtIx8FISb8k
 5reQbWJirqIy+1Aw6KC51CziyLrS6D2iuT8p/8nSkmzPMkFfg+NRlvouZ
 eHuxhxe5MCu+C5/J1PDmw2VTPZks1pg7huhAp0DNALTtZQkMy/ASLPF5a I=;
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbJ7mlnjIrnk+5p16JzZ9hO0HOsu8erFMCv6GIo1CTnDAMWMLMPIgvBnMFtm0bu3Q3rMy1IHx7M3Y9pbCQZ10Ej0jL32NeqTo+veu2SIVqN/5FN4oU8W0S0SFy3NL+QC/ozRkJeSimEck0Qq50t2neCvTmr43nW1MOHZfC4TFhQgDpob0rLqQhVA0vW0bFRT4L9V9uqjneja/mxTWM2dpZIhPNHyWCLerPBtYGAs2u6+PUObrkXGBV3NohHHRjl9WaRURIrmmnhCDt0hFqg1ymbCpe1PnsrajStWgDiem+D8FW9wX2OGSXSEb2odTVv5AqQw4QJgzd5JbNuG3rzRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlSfTqWKHd1R4grbY4wZrWiYnKPZYPM5Hs0Sz684bOM=;
 b=ekXTV39n3ltq5N8vE9sNLvxr6HiGkTaIjOYniUMX7rz+2tPRWh3OXuAUdaYntxB4sP+OeyDwrKlEK3qcyv+Z/MU9lLYkxQwsZ6r2VYdVrmyYCejG3UiDSDWpxZ/0/Gn2dIakmFN4uKBs2jptchmOZi81PqPbQrX/kJjzVgujaW0kviXav27lB8GBHvPP44/bMuunYNkUSyj4zLRUOir2jxGPiRMQLlUK4Rciis9O+d4TLAyOZ2iwgVaK37+CyZFdd2V8z8+QaINTt7iNmb4AjXTOQQGSSocdeL/x+IBrK9EIxQ6amdBafAo9g/NDgaf5b1VKGWaY7gfkfk5WT5qXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM5PR0201MB3429.namprd02.prod.outlook.com (2603:10b6:4:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 13:41:18 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 13:41:18 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Topic: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Index: AQHYOVxnBpAAlUTw+kSisBmWl9Zi3qzFZk+AgArC+LA=
Date: Fri, 25 Mar 2022 13:41:18 +0000
Message-ID: <MW4PR02MB7186E881ABC0620E0A62154EE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
In-Reply-To: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44813e84-3861-406c-cc3a-08da0e652424
x-ms-traffictypediagnostic: DM5PR0201MB3429:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR0201MB3429B6348FB19320B629EDF79D1A9@DM5PR0201MB3429.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PFqF2goh50gFv/JVg+9Tx3XyFQt1TqaRngbxYbVSEaqI+Ibe1O3CNei22GMCNOdtDRCayT4scZGcw4fesDR1PH/O3Xjy9T46y+r+1b+suU31RPma5YwF7rBBFMcmD7uHbpHUG9Q/mZCwHkGU5j5FEPRkR/p+CX7NmqbhQVCDOBLIuVWL/8x4zu+KSKa0nCJsHTON6ibH+iCQwm93VDDTFrypp2CkbHOUhD2rod8nmCkHbZasrKTY0gf4fk2AucuCcBrtleO/NgJrN0yfK5LBY/yl0qdBtzoDOWqwfYspkr+ECMecTyKNTexfXJxWA6TCrvq7/sEzqieA8C/Zo9V7t3wgblYqZFKbvkkFEy201oea6X5lUh1ugdEgqlBILQQNATuZZtZny4VOBQjGov2BReGtlSFDOUgKEu3co0miHJ1IgRI/ElKYDgZ2KnATnR8LJCG+bxszEqhRH7og1ox5nRfIjsN8faXjNh7n0ng//icohcyi05vS8fagZ8dQjU8sZ4u/+hIWorMlSoCpOiFaUKXKuP0IA0PTkjJf8qswscKteZpuyhomVAh61T3/dtm0oNDACrTTY7NTdG61t1Fvu7N/DDuobeTxYvDsvs/vWW8iyZ+kFhKTClIIFq+p+lUQpMclZKr0x11XPcnCh1/38GukYpjAH0fBrjz8B/GfOSAAuj1J0CS9uPOi+tDSS0zqUa1NDnlQKzPBe6DUnPjyrzoQyQ5+QVmldBCtrriDcGjDn9hqpjhsW4+/pwVXTJcEcsAJ7iiGI4jYb62fkM1g02jLJvwVMcu/wx5VFwNJ3Dk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(64756008)(66446008)(33656002)(316002)(76116006)(66556008)(4326008)(6506007)(508600001)(38070700005)(110136005)(8676002)(966005)(54906003)(71200400001)(86362001)(38100700002)(66946007)(52536014)(8936002)(55016003)(122000001)(5660300002)(107886003)(186003)(26005)(7416002)(2906002)(83380400001)(9686003)(53546011)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU45MUpVZlVaTzgzenh5RHBSU2R5SHJYWjJrYytQTEZQOHhEZWZxYWJUR2Ey?=
 =?utf-8?B?SFN2Uyt0TzNHNis0VmlCNVBBM0VyZGdwY3pVTXpBOStHdDhjOTdDNlA5VFhF?=
 =?utf-8?B?NExDT29uSE9hVmxaRlRpQVByT2s1MTlwSlNabjNOelowR0NHVHd3MEtCQmRy?=
 =?utf-8?B?M1JQVXBwVjZGS1N4VGhsNjNZUk9jNThETFoxbE5yMnV4K01rRkRFKzEvbHU5?=
 =?utf-8?B?ZTE3ek9ldEsyL0xRR2dFczVyTmNrM3VoVnZ3MERta20wS3dIbWlKL094Lzh2?=
 =?utf-8?B?aWdXcGxwMk0va1dQaFJ2dVkyaG05VkErbHRFNzVKOUJMakU0T3V1dlhEaUxo?=
 =?utf-8?B?czhWTFcrd3NXTm9WTmVUN3NtVkxabzFCVDZ2M3RGUUhjK0FkZ0w0b2FsUVE4?=
 =?utf-8?B?aEJxT29XbXdTR0dRb3lBWXF2MzlzNEdpVktIVEc3eTJsckVnMkxkcFJRL3pW?=
 =?utf-8?B?WHpBeGNkZXA5SUVqZXptVGYzWE1xWi9KTEg5U1VWSFJ5SG5xaHQwMExwNjdX?=
 =?utf-8?B?bVp6UjRDeVo3VFoyd3FRaEI5VkV1VlNHeEptOFVyemZveXNjZzQ0RUR4UXht?=
 =?utf-8?B?QkliaUxoU09GcUE0V05CdERrMXFsa29jVVdjUmF3cG9YUlNkdDRSV3c4M01X?=
 =?utf-8?B?UTRkTy9Ib3ZlRUd5MzVpanEwYXJ5bWxVTWVDYTNrM2hxdVF2WHA2TWw0b2FB?=
 =?utf-8?B?ZE1sUklpTXdxekRtRUxaYXRLRjluNnFNTGlpYVBqRUxKYVNabTMyQ0xzZGxQ?=
 =?utf-8?B?N3pYaFFnTk5NMElBaWl1RWp4YVhxNUhEeFA3UmNLVUQzdHQyWDFhWXEzRjFs?=
 =?utf-8?B?cEo3Y0NyOVpNMnRMVlNIV0Q2SDBGRzlzUk5wam84VDNVSHBNNVpYdkFzMHNZ?=
 =?utf-8?B?WkdmYTd3czJTQ3h5YXVoeFFzR0Y1bWhSRUQ4TzhDUDBDSzBkdFF1RkJ5eUxn?=
 =?utf-8?B?YWNtZnJVNzVRd2NzTG9INmV5TEpoanZWWFdURTJSUHpPQkRyMWVkYTBabzNi?=
 =?utf-8?B?akZpUjhLSHIvM0lkS0lMQm9jZVZmcm5WSTJ3MFZmZjBqbVVKTGdUNXZCK2VU?=
 =?utf-8?B?LzNoMkNCUCtwSCtpeTgvQmoyVTZCQ2M1bWlBeVhab0ZZaFBSZ3hmQ1A2QWZQ?=
 =?utf-8?B?K0lWcTI3VUJEalVaa3ZSeU8vaDBmYWZoRTdjdzA2OWl0SEhnRWtHT0cyK1Ba?=
 =?utf-8?B?d0RFNSt5RkdKNUhhNWFFWWtwSDR6cmJZMklObk83aXZSYVNFblMwdTd1Nlpz?=
 =?utf-8?B?V1JReUg2V3lEd2k0TW1kMHhVRHY3VXM2QkZMTXZPOEdLcEwyOSttdGxMS2hJ?=
 =?utf-8?B?N0dBZlZiVnhJRjJUMWQxeVd0eS94ME9RVkRFRE9tcjExWVFRYXExT0s2bU9T?=
 =?utf-8?B?ZFdFMnpKSy8wQ2gxcklCNFZISmdURzZjc2cwdHVVVEJ1dkxZUXpTNGxEalNy?=
 =?utf-8?B?SHFjbHp3VGFzRVZYYXg2bGJKOWtBMnZyU09Na1pMem9VTkhKdGdudWhSR0Nj?=
 =?utf-8?B?ZG95V2V3Wk9PdDlyNFdNcVI2dGtMQk5jMUo0STgyZm5tZXFvZGRqcS92N3p2?=
 =?utf-8?B?WmlyWEZWbkJCbTl2TWxmV2NkZEdEMGVvSlVBVk9LOVFRU0hZakt2a2VNTk9k?=
 =?utf-8?B?YXNKZ0JpZVRMOHlGMFB1eEc1VWM1UkltQ1FpMmZUU0FlQ0ExVmlBUHhEbmoz?=
 =?utf-8?B?Q0NtL0o0WHpzV055SFBxRnNhWGpNaGpLaE5kd29DeVppZTZLOTl1OWhFMzFy?=
 =?utf-8?B?cGh4OUo3Vi96U3FnVktCR3E1SDFvNUVqZ3VJZ1VqZnRWUWRnUGdXNGxQcHlQ?=
 =?utf-8?B?OUhSSkFZckR5OW1IR2I4OEloRXVuWC9sYm1tdlJsY2N6WjI2d01pRkZ4M211?=
 =?utf-8?B?L0tHWDFLNzRWNTQwY2xqU2g1RjB0dGVvR0JvRzZMTnA2MldpRS9BcVFsQWxz?=
 =?utf-8?Q?KCAo4i5l9sN7Rd3flgF+lMBDBzAPjDIq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44813e84-3861-406c-cc3a-08da0e652424
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 13:41:18.5192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJr+9cRaLM6rsrA9jDwHvlYQJIgWDnPvGfPwyFLY35q1VDjmohFvxx0kfL2J9RmoPNZlwkAxBXPMBSu5/BNMOcuPcJuo033h/cY0BwYJkPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3429
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDEw
OjUxIFBNDQo+IFRvOiBTYW5rZWVydGggQmlsbGFrYW50aSAoUVVJQykgPHF1aWNfc2JpbGxha2FA
cXVpY2luYy5jb20+DQo+IENjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+OyBsaW51eC1hcm0tbXNtIDxsaW51eC1hcm0tDQo+IG1zbUB2Z2VyLmtlcm5lbC5vcmc+
OyBmcmVlZHJlbm8gPGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiBMS01MIDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5E
DQo+IEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc+OyBSb2IgQ2xhcmsNCj4gPHJvYmRjbGFya0BnbWFpbC5jb20+OyBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz47IFN0ZXBoZW4NCj4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9y
Zz47IHF1aWNfa2FseWFudCA8cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPjsNCj4gQWJoaW5hdiBL
dW1hciAoUVVJQykgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+OyBLdW9nZWUgSHNpZWggKFFV
SUMpDQo+IDxxdWljX2toc2llaEBxdWljaW5jLmNvbT47IEFuZHkgR3Jvc3MgPGFncm9zc0BrZXJu
ZWwub3JnPjsNCj4gYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7IFJvYiBIZXJyaW5nIDxyb2Jo
K2R0QGtlcm5lbC5vcmc+Ow0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPjsgRGF2aWQgQWlybGllDQo+IDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgVGhpZXJyeSBSZWRpbmcNCj4gPHRoaWVycnkucmVkaW5n
QGdtYWlsLmNvbT47IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz47DQo+IGRtaXRyeS5i
YXJ5c2hrb3ZAbGluYXJvLm9yZzsgcXVpY192cHJvZGR1dCA8cXVpY192cHJvZGR1dEBxdWljaW5j
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzldIGFybTY0OiBkdHM6IHFjb206IHNj
NzI4MDogQWRkIHN1cHBvcnQgZm9yIGVEUA0KPiBwYW5lbCBvbiBDUkQNCj4gDQo+IEhpLA0KPiAN
Cj4gT24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMTA6MzYgQU0gU2Fua2VlcnRoIEJpbGxha2FudGkN
Cj4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRW5hYmxlIHN1
cHBvcnQgZm9yIGVEUCBpbnRlcmZhY2UgdmlhIGF1eF9idXMgb24gQ1JEIHBsYXRmb3JtLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1aWNfc2JpbGxha2FA
cXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHY1Og0KPiA+ICAgLSBD
aGFuZ2UgdGhlIG9yZGVyIG9mIHBhdGNoZXMNCj4gPiAgIC0gUmVtb3ZlIHRoZSBiYWNrbGlnaHQg
bm9kZXMNCj4gPiAgIC0gUmVtb3ZlIHRoZSBiaWFzIHNldHRpbmcNCj4gPiAgIC0gRml4IGNvbXBp
bGF0aW9uIGlzc3VlDQo+ID4gICAtIE1vZGVsIFZSRUdfRURQX0JQIGZvciBiYWNrbGlnaHQgcG93
ZXINCj4gPg0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gICAtIENyZWF0ZSBuZXcgcGF0Y2ggZm9y
IG5hbWUgY2hhbmdlcw0KPiA+ICAgLSBSZW1vdmUgb3V0cHV0LWxvdw0KPiA+DQo+ID4gQ2hhbmdl
cyBpbiB2MzoNCj4gPiAgIC0gU29ydCB0aGUgbm9kZXMgYWxwaGFiZXRpY2FsbHkNCj4gPiAgIC0g
VXNlIC0gaW5zdGVhZCBvZiBfIGFzIG5vZGUgbmFtZXMNCj4gPiAgIC0gUGxhY2UgdGhlIGJhY2ts
aWdodCBhbmQgcGFuZWwgbm9kZXMgdW5kZXIgcm9vdA0KPiA+ICAgLSBDaGFuZ2UgdGhlIG5hbWUg
b2YgZWRwX291dCB0byBtZHNzX2VkcF9vdXQNCj4gPiAgIC0gQ2hhbmdlIHRoZSBuYW1lcyBvZiBy
ZWd1bGF0b3Igbm9kZXMNCj4gPiAgIC0gRGVsZXRlIHVudXNlZCBwcm9wZXJ0aWVzIGluIHRoZSBi
b2FyZCBmaWxlDQo+ID4NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gICAtIFNvcnQgbm9k
ZSByZWZlcmVuY2VzIGFscGhhYmV0aWNhbGx5DQo+ID4gICAtIEltcHJvdmUgcmVhZGFiaWxpdHkN
Cj4gPiAgIC0gTW92ZSB0aGUgcHdtIHBpbmN0cmwgdG8gcHdtIG5vZGUNCj4gPiAgIC0gTW92ZSB0
aGUgcmVndWxhdG9ycyB0byByb290DQo+ID4gICAtIERlZmluZSBiYWNrbGlnaHQgcG93ZXINCj4g
PiAgIC0gUmVtb3ZlIGR1bW15IHJlZ3VsYXRvciBub2RlDQo+ID4gICAtIENsZWFudXAgcGluY3Ry
bCBkZWZpbml0aW9ucw0KPiA+DQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAt
Y3JkLmR0cyB8IDkzDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspDQo+IA0KPiBBdCBhIGhpZ2ggbGV2ZWws
IEknZCBleHBlY3QgeW91ciBwYXRjaCB0byBiZSBiYXNlZCB1cG9uIE1hdHRoaWFzJ3Mgc2VyaWVz
LCBBS0ENCj4gdGhlIDQgcGF0Y2hlcyBmcm9tOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIyMDMxNjE3MjgxNC52MS4xLkkyZGVkYThmMmNkNmFkZmJiNTI1YTk3ZDhmDQo+IGVl
MDA4YTg0NzdiN2IwZUBjaGFuZ2VpZC8NCj4gDQo+IEknbGwgbGVhdmUgaXQgdXAgdG8geW91IGFi
b3V0IHdoZXRoZXIgeW91IGNhcmUgdG8gc3VwcG9ydCBlRFAgb24gdGhlIG9sZA0KPiBDUkQxLzIg
b3IganVzdCBvbiBDUkQzLiBQZXJzb25hbGx5IEknZCB0aGluayBDUkQzIHdvdWxkIGJlIGVub3Vn
aC4NCj4gDQo+IFRoZW4sIEknZCBleHBlY3QgeW91ciBwYXRjaCB0byBtb3N0bHkgaW5jb3Jwb3Jh
dGUNCj4gPGh0dHBzOi8vY3JyZXYuY29tL2MvMzM3OTg0ND4sIHRob3VnaCB0aGF0IHBhdGNoIHdh
cyB3cml0dGVuIGJlZm9yZSBhdXgtDQo+IGJ1cyBzdXBwb3J0IHNvIHRoZSBwYW5lbCB3b3VsZCBu
ZWVkIHRvIGdvIGluIGEgZGlmZmVyZW50IHBsYWNlLg0KPiANCj4gU3RlcGhlbiBhbHJlYWR5IGdh
dmUgc29tZSBjb21tZW50cyBhbmQgYmFzaW5nIG9uIE1hdHRoaWFzJ3MgcGF0Y2hlcyB3aWxsDQo+
IGJlIGEgcHJldHR5IGJpZyBjaGFuZ2UsIHNvIEkgcHJvYmFibHkgd29uJ3QgY29tbWVudCBsb3Rz
IG1vcmUuDQo+IA0KPiANCg0KSSByZWJhc2VkIG15IGNoYW5nZSBvbiB0b3Agb2YgTWF0dGhpYXMn
cyBjaGFuZ2VzIG5vdy4gV2UgYXJlIGRpc2N1c3NpbmcgYWJvdXQgdGhlIHFjYXJkIGNoYW5nZXMg
aW50ZXJuYWxseSB0byB1bmRlcnN0YW5kIHRoZSB3YXkgYWhlYWQuDQpJIGJlbGlldmUgYWxsIG15
IGN1cnJlbnQgY2hhbmdlcyBhcmUgbG9jYWxpemVkIHRvIHRoZSBjcmQtcjMgZmlsZXMgb25seSBm
b3IgdGhlIHF5YWxjb21tIGNyZDMuMQ0KDQpJIHdhbnQgdG8gaGF2ZSBhIGRpZmZlcmVudCBzZXJp
ZXMgZm9yIGMgYW5kIGR0IGNoYW5nZXMgdG8gZXhwZWRpdGUgcmV2aWV3IHByb2Nlc3MuIE1heSBJ
IHNlcGFyYXRlIHRoZSBjIGNoYW5nZXMgZnJvbSB0aGlzIHNlcmllcz8NCg0KPiA+ICsmbWRzc19l
ZHAgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIGRh
dGEtbGFuZXMgPSA8MCAxIDIgMz47DQo+ID4gKyAgICAgICB2ZGRhLTFwMi1zdXBwbHkgPSA8JnZy
ZWdfbDZiXzFwMj47DQo+ID4gKyAgICAgICB2ZGRhLTBwOS1zdXBwbHkgPSA8JnZyZWdfbDEwY18w
cDg+Ow0KPiA+ICsNCj4gPiArICAgICAgIGF1eC1idXMgew0KPiA+ICsgICAgICAgICAgICAgICBl
ZHBfcGFuZWw6IGVkcC1wYW5lbCB7DQo+IA0KPiBBcyBTdGVwaGVuIHBvaW50ZWQgb3V0LCBpdCBz
aG91bGQgYmUgY2FsbGVkICJwYW5lbCIuDQoNCk9rYXkuIFdpbGwgbWFrZSB0aGF0IGNoYW5nZQ0K
