Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4044F19A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 19:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9A210E60F;
	Mon,  4 Apr 2022 17:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602510E60F;
 Mon,  4 Apr 2022 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649094969; x=1649699769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VVR2iJL73Cde675ch6YnR7wZpN0XGElqNk8r/WY52/4=;
 b=rxxYiDYIxMnik7TxgY9GvDQyuDWUGRL9DlNRjFSDwTib3xk70o4Jsrxs
 3R0vdyKyAfYMaoExaqz5IbbABf5WPUgqjWjHmfyEDMQAEvqV6BCTALOu7
 05ZPYDgAoBtJB2esEhaJBGPTos85svkqdFhGN3EEuVfbQp7hR83pnq4wi I=;
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 17:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKuVPZUpdUEDnnBUK+LX9T33UXEteFYUPShieZltyjBLeaZII8XmwSSj+wq5ZRXNjjNYFBIDVdkr+3v+wYD+JhT9+mnAKuDnn34IuTXDhoo3O1/1n0kQRZlbdMrip7Iyd11/0iEC2fuPbyQxQnFWyvS4HBs6XjglolHgohqb1dwpBX7DSFwnWEOcjzS9h94+3KEHCRJlJwISYPYtdixF2tY64jXs3J3+1jWKfgPaOJA6hdDwGkTULytiZYUwywdXvosUJVVzwdP4X4uRFHf6o5pUGZBJJ0I14N5qSkqnohEhbKd7GbHphR0/cZ3c1in5rQOTXzJ39HZ8/unsm5yf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVR2iJL73Cde675ch6YnR7wZpN0XGElqNk8r/WY52/4=;
 b=QygCwXJ/gT+7qxc4q4SmoKOS7uYLrhjg9E7S600103HHDp6rmVH6A1rfxBNiuzzfYfKhO+PHHXLbbbxetOX4ztR4q7XjXnGgB/EESQIK353YvAiAs6aZxAzTNMpt4qyryKXw4yI6SPo50F6btcY5YLUrvdzvlH9QHsTR+HFQEJo3gExV3ycG+NiX9qzpSzvQx3ZpbQK9BkV9WQkEbARWR44/IX/O4lqd0Was8BqOjwXr7jQxvclcgx/R8cGuY718gjdjoXBcBzg31ON27LYgeVo0BgOsNMBhytUhZ7EBMVZHj8escPSugnAsVeSr7UV7ya9r//Icb9yjhmsoeeb4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM6PR02MB4201.namprd02.prod.outlook.com (2603:10b6:5:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 17:56:00 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 17:56:00 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
Thread-Topic: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
Thread-Index: AQHYRE/EvdWk4OgVD0y7uP1mIx6Fl6zYfvSAgAB/n3CAAEfjgIAAB3uggAAISwCABrud4A==
Date: Mon, 4 Apr 2022 17:56:00 +0000
Message-ID: <MW4PR02MB7186B340B2AB815281313250E1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
 <MW4PR02MB7186669BA1B19FA4F184B558E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <d9ac1cee-d4fc-09ae-b2df-82ae2ecd57fb@linaro.org>
 <MW4PR02MB71864413E9E3624D2F48F046E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpooNVxOUa20fACGf3rTVcHBvLKP2=7Eb0x8oxxE7f2iGg@mail.gmail.com>
In-Reply-To: <CAA8EJpooNVxOUa20fACGf3rTVcHBvLKP2=7Eb0x8oxxE7f2iGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27efaed3-1c51-44c3-ba66-08da166460fd
x-ms-traffictypediagnostic: DM6PR02MB4201:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB4201C651E6793FCA462E79B59DE59@DM6PR02MB4201.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b6w7NCtvOC/dibeZhWNMlCXCOVnZawjNrNHWvnTjRB2vjBlcJ3gheToR39dybnx0X9Ba7yQPvgf7GFdWgnrBlXnPOrIWq3du34IlSq++JbdrW4eYYaHrJtI1BFl49rlGNh5CIv8YOKPmNWTmNpaLnWNX8/RqGPURR0HtwsLl2BZfL4cNGlTdToQsQoH66Uz6/WYTXCo5mcsszlyXsfs0Ah6M3O433e1F1BrEi+hjRfilz5OY0oB0VZFlO6kBSPglOm2YbpdGtarpneFWXd3GfCNbZlMjSKnf23w+M/meSQ1ZwtHIk853+MDpmMGmoXAqwdBtn6XCUe9mGcYWcHg3stdqksh2MFpPeJ8AM0r1LYqK6V0CtHNXH7pAVDs8chnOLMn2npLq+VmGHCu7Cw5X4qfqQ6peGdgYRrEAG9A7rKKw6o+3y+7zoVI0LasIn+SxiTeZASFedSPBFupH4s19CTkY8uy10wwPtIoH0f855d+QbqLKwM4mF1r1rHfS3HpTm+jlxMyv7idoRZ0do9MLqOYXvABectZoXCB8SSbsISJ1GL2BavCnSwPXYqU7mp6OoE+rCusjOG+d9niE7lgRJop2zZnGs9Cm+hGEIoOsJNabHginhDGbWv9bYvFUlHoQ5Tfm6gwIzr4SgmFEk+xXOFNwDEEtG2SR2/5nzDo77rJMoeg0uEGDVUxgTVjTS0qk5RgsRJLntyVogcQzFfM8hg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(83380400001)(4326008)(55016003)(5660300002)(33656002)(316002)(52536014)(54906003)(71200400001)(8936002)(8676002)(6916009)(64756008)(66446008)(66476007)(66556008)(7416002)(66946007)(76116006)(86362001)(53546011)(38100700002)(186003)(9686003)(2906002)(508600001)(107886003)(7696005)(6506007)(26005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cENINTVkZVpkaGgrSHNreEtoY1BqQVB1L01kVmFqS3FHeWpTbnUyTGR4d2hC?=
 =?utf-8?B?Y2VEeklSSURiRkJJcXV2aTFBUHNDZnppcmEwTHJvVVhqUGNOcU5MNlROOWsy?=
 =?utf-8?B?K3hQZUFQaUZaREFaLzF1UFlSQW1UTXRBY1VSU1JOV1ppSnlaMlpPOFlodDND?=
 =?utf-8?B?dWxING9jWmlsS2JHWVM5VjJFR0U2UWFyd1hia0drMjUyTHhSY1NzdUs3RzFH?=
 =?utf-8?B?THNjYUwwNUNvcmZnUmtBQ2Q3YjlScXdWYzZKVWNFNkpaWlR3RHI0UGZhMkJW?=
 =?utf-8?B?NUtGSDhPUzI1S0ZkektEK1dMOWxsdjZOWFo2WnFEcHVhS3FJQk1MdnpGUWhq?=
 =?utf-8?B?TWFNNjZBbDRZVkt4cE5qTjJoTS9rNk96bkpJa0EvaEpkcnZuRjI3dm5QdjNU?=
 =?utf-8?B?aFRFbEtLU2VWQjBraUN2N1pZbGRUUWd1cW5TempTaU1sV2ZUT0pPRVFrSk43?=
 =?utf-8?B?ZWhseFI3SlBtZmRrT245YjZNR0R3cElYU09nUm01RzhGRlc0VFRnMUtwN2pG?=
 =?utf-8?B?Vno4L3k3SitIWFRiUjVabFAyN2VlalhFMWcxQVVXWXBpbVMxRkdiTmZCeW9L?=
 =?utf-8?B?clpGaUg1dVhtTUNDc3BCOVV5Q0wzekVtWi9WeGx6d1JsNUppQThsNFBEMTJw?=
 =?utf-8?B?azZQK2JGM2VTY21HMU5BY3VYRDFDVUhoQWExcXd2NGgzSlU1WW5GZUlEMHo1?=
 =?utf-8?B?amRXRWtsYkhoenJNM2R3MXl0eFZBMlVvWVJmeWcrWTZVNWJ1akdJRFlFdVJB?=
 =?utf-8?B?eUFjSUtNTGF6cVVKa1JMbzZTOHB2c0xKZVdFcFdia29EcEQ1cWdQcUoxVXhm?=
 =?utf-8?B?SVpMWUJ4ZDlyOTU4MDRUbm5oN3llT0MyMEhSZTdLZ05qbzRWakdTL1R4ekJ4?=
 =?utf-8?B?UmF2enU0QjRpVkh4dlFqZGR6Y1V2d2p4RzdkZXVOelRpNE56OWhzdGVFcmda?=
 =?utf-8?B?UEx1djJUZ0FCdVBCeUthOGlNK1VsUjRQUzhseDY1ZHZtR24zZGdIclZMbEFa?=
 =?utf-8?B?TkY2SzNkeFFGWjhzYkx3V01TZytQY2wzenNORTFmaWlqNzFrQ2JqYUVNMFRj?=
 =?utf-8?B?VlNlRjZ1OHNwYmFlZGR5MmtpMGZzOFNlZW94eFA2N0xPeFIrSlNGNkMzRTdz?=
 =?utf-8?B?QnBNVWZVd1lBRDVoaVpzejkvNldQaytlQmJKQi9uRU41dkNKR21vQW1tUU1H?=
 =?utf-8?B?OGF4NHIzNjdXSmt3eVc2QjRmV1lrTncrUXhubUs1SU5PS0pDTDkxWWptZUJE?=
 =?utf-8?B?dXRmYU9EQUFtSWI1d0Vpb0tLUWxyTS9rS2RZeEswNDhVeDlwUWEwU3dUaUR3?=
 =?utf-8?B?WXJUUytpNzFpdWNnYTg3bENNcEtXS1hPMzkyMVBKY0orSi9CSGdkbFZ2dEcr?=
 =?utf-8?B?clduWSs0WFFOOHc3WkduZDk2dWo3RjJGejlFMW45akc3NjhLQkNWT1pUcmtV?=
 =?utf-8?B?S2htUGk3TnVQNktUZ1M0dXplTytCbnpJbUVPOGorbHFqTWVRMmNZbzJQNUZq?=
 =?utf-8?B?Q0xtNDltTlErYm9HUnJMcTlYYWdkbjQ3TGVxa245TnUxK3VkK2RvUVpoZVRl?=
 =?utf-8?B?ZVQ2TFZmOGZVSHVGUm9naTVheVlCeVNpWW9RdzUvZVhvMWxNNzJ4bjlXQ1A1?=
 =?utf-8?B?TzJ3SG1EeFBBV20wTzg2aE1ubUJGZFFqYm9ZQ3F1TTFMN212ZWxqaUNJdHpU?=
 =?utf-8?B?Rk5tYzUvVEV3RzU3YldJZ0xrZ0V6M3hGQTlCcm9tUEJFYmhLM2UvbjkxYnBM?=
 =?utf-8?B?emlGWXRwQ0VHV2lEbnA4QTZ1NjhBeW1SaXp2OURNRXk3cGVaeVlDSmY2dUpC?=
 =?utf-8?B?QmNYOFhRSTEvV1VYdVpnOUJWYkRndDdsakNGMEdwZFpyUHpablNVR012NytE?=
 =?utf-8?B?T2dybGRJTlo4c0RkWVJMYXhKYzBzSHBLc0ltUVdkdzZndFVvZFhZWVdNZjNO?=
 =?utf-8?B?ZHViZVpWWDJFWXRtRWlPS0ZaQW45SGVVYWk2RzdDNnF4Vmc5N1hiYWpMcnFJ?=
 =?utf-8?B?Yk9uVWtuVXdSUnZFQ3Q1UE55V1RJTWppOUFWeTNLazczTTk2MVVxNXJWVUov?=
 =?utf-8?B?dmpjNEhNUThPTHBjbmZQRllMOEZHelp3SjFVWFo4NzIyN0Jkc21XNUhvb2gr?=
 =?utf-8?B?YVZxcG9kQStBS3JEUXdLUjlvUjF3TDBwcWtkZ0VzbXg5M3NFRVdmL0VMdmZu?=
 =?utf-8?B?cXpHL2dzNU1JVGdzcHdhYWM3b3o1RWdpeW90dTR1QjJxWTliVFdoSmUrUjdi?=
 =?utf-8?B?RzkxWTZPRno3aGg3ZloxejZKTTNINjdBbGxmS2drZzhaRjR4eDhLY0w4R1FP?=
 =?utf-8?B?TFMxb01GVEdIZEZDU3BjSjdDd2RaRWtDbnlZWjUrQWRBQ1haaG12UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27efaed3-1c51-44c3-ba66-08da166460fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 17:56:00.4409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqDixl8mVVHAAO3MC0m5ONy+oAHNeZNDXDSdk7XQsLCcAvAjY4Rr1FcExZVzEFGOU6StVvvjv87drEbt5ImsCBgSDjvvqDqUl+LxttZPDC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4201
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBUaHUsIDMxIE1hciAyMDIyIGF0IDE0OjA1LCBTYW5rZWVydGggQmlsbGFrYW50aQ0KPiA8
c2JpbGxha2FAcXRpLnF1YWxjb21tLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBEbWl0cnksDQo+
ID4NCj4gPiA+IE9uIDMxLzAzLzIwMjIgMDg6NTMsIFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlD
KSB3cm90ZToNCj4gPiA+ID4gSGkgRG1pdHJ5LA0KPiA+ID4gPg0KPiA+ID4gPj4gT24gV2VkLCAz
MCBNYXIgMjAyMiBhdCAxOTowMywgU2Fua2VlcnRoIEJpbGxha2FudGkNCj4gPiA+ID4+IDxxdWlj
X3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IFRoZSBp
bnRlcnJ1cHQgcmVnaXN0ZXIgd2lsbCBzdGlsbCByZWZsZWN0IHRoZSBjb25uZWN0IGFuZA0KPiA+
ID4gPj4+IGRpc2Nvbm5lY3QgaW50ZXJydXB0IHN0YXR1cyB3aXRob3V0IGdlbmVyYXRpbmcgYW4g
YWN0dWFsIEhXDQo+IGludGVycnVwdC4NCj4gPiA+ID4+PiBUaGUgY29udHJvbGxlciBkcml2ZXIg
c2hvdWxkIG5vdCBoYW5kbGUgdGhvc2UgbWFza2VkIGludGVycnVwdHMuDQo+ID4gPiA+Pj4NCj4g
PiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFr
YUBxdWljaW5jLmNvbT4NCj4gPiA+ID4+PiAtLS0NCj4gPiA+ID4+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfY2F0YWxvZy5jIHwgNSArKystLQ0KPiA+ID4gPj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+ID4g
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jYXRhbG9nLmMNCj4gPiA+ID4+PiBpbmRl
eCAzYzE2Zjk1Li4xODA5Y2UyIDEwMDY0NA0KPiA+ID4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfY2F0YWxvZy5jDQo+ID4gPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kcC9kcF9jYXRhbG9nLmMNCj4gPiA+ID4+PiBAQCAtNjA4LDEzICs2MDgsMTQgQEAgdTMyIGRw
X2NhdGFsb2dfaHBkX2dldF9pbnRyX3N0YXR1cyhzdHJ1Y3QNCj4gPiA+ID4+PiBkcF9jYXRhbG9n
ICpkcF9jYXRhbG9nKSAgew0KPiA+ID4gPj4+ICAgICAgICAgIHN0cnVjdCBkcF9jYXRhbG9nX3By
aXZhdGUgKmNhdGFsb2cgPSBjb250YWluZXJfb2YoZHBfY2F0YWxvZywNCj4gPiA+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHBfY2F0YWxvZ19wcml2YXRlLCBk
cF9jYXRhbG9nKTsNCj4gPiA+ID4+PiAtICAgICAgIGludCBpc3IgPSAwOw0KPiA+ID4gPj4+ICsg
ICAgICAgaW50IGlzciwgbWFzazsNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+ICAgICAgICAgIGlzciA9
IGRwX3JlYWRfYXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfSU5UX1NUQVRVUyk7DQo+ID4gPiA+
Pj4gICAgICAgICAgZHBfd3JpdGVfYXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfSU5UX0FDSywN
Cj4gPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGlzciAmIERQX0RQ
X0hQRF9JTlRfTUFTSykpOw0KPiA+ID4gPj4+ICsgICAgICAgbWFzayA9IGRwX3JlYWRfYXV4KGNh
dGFsb2csIFJFR19EUF9EUF9IUERfSU5UX01BU0spOw0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gLSAg
ICAgICByZXR1cm4gaXNyOw0KPiA+ID4gPj4+ICsgICAgICAgcmV0dXJuIGlzciAmIChEUF9EUF9I
UERfU1RBVEVfU1RBVFVTX01BU0sgfCBtYXNrKTsNCj4gPiA+ID4+DQo+ID4gPiA+PiBJIHN1c3Bl
Y3QgdGhhdCB0aGUgbG9naWMgaXMgaW52ZXJ0ZWQgaGVyZS4gU2hvdWxkbid0IGl0IGJlOg0KPiA+
ID4gPj4NCj4gPiA+ID4+IHJldHVybiBpc3IgJiBEUF9EUF9IUERfU1RBVEVfU1RBVFVTX01BU0sg
JiBtYXNrOw0KPiA+ID4gPj4NCj4gPiA+ID4+ID8NCj4gPiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+
IFRoZSB2YWx1ZSBvZiBEUF9EUF9IUERfU1RBVEVfU1RBVFVTX01BU0sgaXMgMHhFMDAwMDAwMCBh
bmQgdGhlDQo+ID4gPiB2YWx1ZQ0KPiA+ID4gPiBvZiB0aGUgcmVhZCBpbnRlcnJ1cHQgbWFzayB2
YXJpYWJsZSBjb3VsZCBiZSBpcyAweEYuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBtYXNrIHZhbHVl
IGlzIGluZGljYXRlZCB2aWEgdGhlIHJlZ2lzdGVyLA0KPiA+ID4gPiBSRUdfRFBfRFBfSFBEX0lO
VF9NQVNLLA0KPiA+ID4gYml0cyAzOjAuDQo+ID4gPiA+IFRoZSBIUEQgc3RhdHVzIGlzIGluZGlj
YXRlZCB2aWEgYSBkaWZmZXJlbnQgcmVhZC1vbmx5IHJlZ2lzdGVyDQo+ID4gPiBSRUdfRFBfRFBf
SFBEX0lOVF9TVEFUVVMsIGJpdHMgMzE6MjkuDQo+ID4gPg0KPiA+ID4gSSBzZWUuIE1heWJlIHRo
ZSBmb2xsb3dpbmcgZXhwcmVzc2lvbiB3b3VsZCBiZSBiZXR0ZXI/DQo+ID4gPg0KPiA+ID4gcmV0
dXJuIGlzciAmIChtYXNrICYgfkRQX0RQX0hQRF9JTlRfTUFTSyk7DQo+IA0KPiBVZ2gsIGV4Y3Vz
ZSBtZSBwbGVhc2UuIEkgbWVhbnQ6DQo+IA0KPiByZXR1cm4gaXNyICYgKG1hc2sgfCB+RFBfRFBf
SFBEX0lOVF9NQVNLKTsNCj4gDQoNCk9rYXkuIEkgd2lsbCBjaGFuZ2UgaXQuDQoNCj4gPiA+DQo+
ID4NCj4gPiBJIGJlbGlldmUgdGhlIGNvbmZ1c2lvbiBvY2N1cnJlZCBiZWNhdXNlIHRoZQ0KPiA+
IERQX0RQX0hQRF9TVEFURV9TVEFUVVNfQ09OTkVDVEVEIGFuZCBvdGhlcnMgd2VyZSBkZWZpbmVk
IHVuZGVyDQo+IHRoZSBzYW1lIHJlZ2lzdGVyIGRlZmluaXRpb24gYXMgUkVHX0RQX0RQX0hQRF9J
TlRfTUFTSyBJIHdpbGwgcmVhcnJhbmdlDQo+IHRoZSBkZWZpbml0aW9ucyBiZWxvdy4NCj4gPg0K
PiA+ICNkZWZpbmUgUkVHX0RQX0RQX0hQRF9JTlRfTUFTSyAgICAgICAgICAoMHgwMDAwMDAwQykN
Cj4gPiAjZGVmaW5lIERQX0RQX0hQRF9QTFVHX0lOVF9NQVNLICAgICAgICAgKDB4MDAwMDAwMDEp
DQo+ID4gI2RlZmluZSBEUF9EUF9JUlFfSFBEX0lOVF9NQVNLICAgICAgICAgICgweDAwMDAwMDAy
KQ0KPiA+ICNkZWZpbmUgRFBfRFBfSFBEX1JFUExVR19JTlRfTUFTSyAgICAgICAoMHgwMDAwMDAw
NCkNCj4gPiAjZGVmaW5lIERQX0RQX0hQRF9VTlBMVUdfSU5UX01BU0sgICAgICAgKDB4MDAwMDAw
MDgpDQo+ID4gI2RlZmluZSBEUF9EUF9IUERfSU5UX01BU0sgICAgICAgICAgICAgIChEUF9EUF9I
UERfUExVR19JTlRfTUFTSyB8IFwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBEUF9EUF9JUlFfSFBEX0lOVF9NQVNLIHwgXA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERQX0RQX0hQRF9SRVBMVUdf
SU5UX01BU0sgfCBcDQo+ID4NCj4gPiBEUF9EUF9IUERfVU5QTFVHX0lOVF9NQVNLKQ0KPiA+DQo+
ID4gQmVsb3cgYXJlIHN0YXR1cyBiaXRzIGZyb20gcmVnaXN0ZXIgUkVHX0RQX0RQX0hQRF9JTlRf
U1RBVFVTDQo+ID4NCj4gPiAjZGVmaW5lIERQX0RQX0hQRF9TVEFURV9TVEFUVVNfQ09OTkVDVEVE
ICAgICAgICAoMHg0MDAwMDAwMCkNCj4gPiAjZGVmaW5lIERQX0RQX0hQRF9TVEFURV9TVEFUVVNf
UEVORElORyAgICAgICAgICAoMHgyMDAwMDAwMCkNCj4gPiAjZGVmaW5lIERQX0RQX0hQRF9TVEFU
RV9TVEFUVVNfRElTQ09OTkVDVEVEICAgICAoMHgwMDAwMDAwMCkNCj4gPiAjZGVmaW5lIERQX0RQ
X0hQRF9TVEFURV9TVEFUVVNfTUFTSyAgICAgICAgICAgICAoMHhFMDAwMDAwMCkNCj4gPg0KPiA+
IERQX0RQX0hQRF9JTlRfTUFTSyBpcyAweEYgYW5kIHNjb3BlIG9mIG1hc2sgdmFyaWFibGUgaXMg
YWxzbyAweEYgKGJpdHMNCj4gMzowKSwgbWFzayAmIH5EUF9EUF9IUERfSU5UX01BU0sgaXMgMCBh
bHdheXMuDQo+ID4NCj4gPiBGb3IgRFAsIHdlIHdhbnQgdG8gZW5hYmxlIGFsbCBpbnRlcnJ1cHRz
Lg0KPiA+IFNvIHRoZSBwcm9ncmFtbWVkIG1hc2sgdmFsdWUgaXMgMHhGLiBXZSB3YW50IHRvIHJl
dHVybiAweDQwMDAwMDAxIGZvcg0KPiA+IGNvbm5lY3QgYW5kIDggZm9yIGRpc2Nvbm5lY3QNCj4g
Pg0KPiA+IEZvciBlRFAsIHdlIHdhbnQgdG8gZGlzYWJsZSB0aGUgY29ubmVjdCBhbmQgZGlzY29u
bmVjdCBpbnRlcnJ1cHRzLiBTbywNCj4gPiB0aGUgbWFzayB3aWxsIGJlIDB4NiAoaS5lLiBEUF9E
UF9JUlFfSFBEX0lOVF9NQVNLIHwNCj4gRFBfRFBfSFBEX1JFUExVR19JTlRfTUFTSykgV2Ugd2Fu
dCB0byByZXR1cm4gMHg0MDAwMDAwMCAob3INCj4gMHgyMDAwMDAwMCBiYXNlZCBvbiBocGQgbGlu
ZSBzdGF0dXMpIGFuZCAwIGZvciBlRFAgY29ubmVjdCBhbmQgZGlzY29ubmVjdA0KPiByZXNwZWN0
aXZlbHkuDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gaXNyICYgRFBfRFBfSFBEX1NUQVRFX1NUQVRV
U19NQVNLICYgbWFzaywgd2lsbCByZXR1cm4gMCBhbHdheXMuDQo+ID4gPiA+DQo+ID4gPiA+Pj4g
ICB9DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiAgIGludCBkcF9jYXRhbG9nX2N0cmxfZ2V0X2ludGVy
cnVwdChzdHJ1Y3QgZHBfY2F0YWxvZw0KPiA+ID4gPj4+ICpkcF9jYXRhbG9nKQ0KPiA+ID4gPj4+
IC0tDQo+ID4gPiA+Pj4gMi43LjQNCj4gPiA+ID4+Pg0KPiA+ID4gPj4NCj4gPiA+ID4+DQo+ID4g
PiA+PiAtLQ0KPiA+ID4gPj4gV2l0aCBiZXN0IHdpc2hlcw0KPiA+ID4gPj4gRG1pdHJ5DQo+ID4g
PiA+DQo+ID4gPiA+IFRoYW5rIHlvdSwNCj4gPiA+ID4gU2Fua2VlcnRoDQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IC0tDQo+ID4gPiBXaXRoIGJlc3Qgd2lzaGVzDQo+ID4gPiBEbWl0cnkNCj4gPg0KPiA+
IFRoYW5rIHlvdSwNCj4gPiBTYW5rZWVydGgNCj4gDQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0
IHdpc2hlcw0KPiBEbWl0cnkNCg==
