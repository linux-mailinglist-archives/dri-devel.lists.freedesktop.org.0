Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73151AB90A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A9C6EAF4;
	Thu, 16 Apr 2020 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AB56E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:14:19 +0000 (UTC)
Received: from [100.112.1.145] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-east-1.aws.symcld.net id 39/47-31195-9E0479E5;
 Wed, 15 Apr 2020 17:14:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTbUxTZxTHee5LuWJrri3QBxSjnVsWthaqC94
 poiQuuR/m5habKamwW6i0UkrX22LRGQvZSChsKzEpOl8oc7yPFKsMnILINhj1nbEZuok6YBY0
 VuqmGbqyXq6y7cvN/3/+v3vO+XAeAhU/FiQSWptFazYyBpkgBtMFbi+UT26syU4d7VhBfXJ5E
 KHOXYfUpdADnJr9uhqlhv8MCqh7AzUI1fijB1B1rsbIZ7oDo8orGnCqqeUgoE7dq8Y3CunuR2
 6MdnuttLelQkB3PrqF08cG36FvVg4gdLDnJwF98sLeLUQWrjdqimzv47rezuu46bdFtqPHl9n
 B3wsdIIYQk3YE+oLHBbyZAnDsoit6PumaCD8zTwC0/3xtDgNkPQo77FUYb/oxGOo/iPKmHcDK
 mYfAARYQGHkGha5eFf+/E4HlZaUob24AGBgbxjlKQL4Maw8fwjgdSx5B4NnpJRyEkg4Elo43R
 3OBhDTC6rAfcQAiAhXB0A9v8/xaGPj2RDQ/7UU4YG/HOUREqmFwVszPqgRwpKEd5ZgFZAas7v
 x1TgMyHj72fYVwGiWl0D9eO6chScIvz15BeR0HJ8fCOM+roL+7aq4/JJfDh63FPJIEh2orAV/
 eDD868gJfToa3rjY+65IOv7/jxnhkJQz3lfDlAljX8wA4werP/7MDr1+F7jMhAa9fgQ11d1FO
 i8jFcPDQOOYGWAtI05j1+TpLIaM3yJWpqXKlcpVcKVeuoRTMHrlGYWXlWoa1yJUKZjerYEsKc
 w15CqPW4gWRG8wzAW8X+KstqOgDCQQiixPtTK/JFi/SFOWV6BhWl2O2GrRsH1hKEDIo6uWyxW
 Ztvta2U2+IXPLzGBJCWaxIErllsYg1MYWsPp+PfEBOOCePfoGKMWORUZsoFWVuiEAkB+msxvk
 Wz9/DEEhKlIhAVFSUWGjSmgv1lv/nU0BKAJlEdJvbRKg3WuYnRQ42sn+syPTmAW4JC/NvlGhH
 0rJPx02sSpldd9Pkz8RnwrR7n6t5A/b6HzfovX63IsZRMCRJ3qaobtKcN6WzqtP3e31oMaOqS
 /D3jH6QUzplM2dWJW9e/9RWm5Ly3bvD0etzrbb9p9L3NbmVPYEnnym3rpVNb9qVVqAeGbjjkB
 Byz3sZO+zSxPhmV4d6qbNsLLx1NCG00kpsP0YPTwsz6s9PVHoPVyR9OLRmxYk9JvOF1Sevqu5
 78Ibf3yieiN/W5ev6xZz0sUrd2iZVe3Yswduytn+DPh3RZl1+SRF1KS5nS8g0XuN5a/+6TSlw
 9NqymL56i6N4ecXMpz51967y2Vx/8W7nxdYrnWWBfufI3dfOjckwVscok1Ezy/wDjLFaRYoEA
 AA=
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-14.tower-396.messagelabs.com!1586970857!102796!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2243 invoked from network); 15 Apr 2020 17:14:17 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
 by server-14.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2020 17:14:17 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id D5C60140975E16EE1671;
 Wed, 15 Apr 2020 13:14:14 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Thu, 16 Apr 2020 01:14:33 +0800
Received: from HKEXEDGE01.lenovo.com (10.128.62.71) by HKGWPEMAIL02.lenovo.com
 (10.128.3.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2 via Frontend
 Transport; Thu, 16 Apr 2020 01:14:33 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.59)
 by mail.lenovo.com (10.128.62.71) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2; Thu, 16 Apr
 2020 01:14:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB6y0AfDbt/GdsdSC1Z0cZIc0c4h8giVXpqGp+hzNl6wZ4Yv75D6ao4WolrFjQXVc8qoLvOs45dLUa2JWbFyXOKKPYLXBjU8peiEfCZ1PX14ZWT1VzO8sG4MyNEwuS/Tz64akN4x14HYzssk0DAHLr61NXKuCqKt+YSvLiFO+o5mqZfTpr9VjtZz8rpAx6FBfBSdIYn6FaRi6BTnz7ZdcmcZFC5WGDkc9AFLveY2tYeRbMBIju9ob6X4lNWDkjSaM+ZYT05YSKgcKw+B1bwuuMFvN562ogKdDFzOlbVb4A4nXO3kIME6CqAjDW6M1MMuz0toxJdNoGXl1jZDiBlKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vY/rDY7Cno6yU4lIxFsKicfG0AtgZ5vMiktMvSN9js=;
 b=A7xvDGNyyNYpDD5nznxpFxK6chOKC6mnOl7ZtmJhYYlmqIPWbmvSkP6wDiXVvc0JefPPzJhgKJq7YWN2WiefUwaSyEGwazkH02OnH0rnCoC+YznmuLW+TsIYA0C0KLG+acHEQvpeDGuPahXokEcXIsTA6b8dOKGcmKCqVkRkSGp3X5VqRgH7pM+H17m8yDxBeXWBUwiFgRcuucuizYAMPS3bQxF2UcuC5lrjZc1bmj58TnOJkWXtKzsnorDm+QadKjZCBkbFdKHklBeHmjEzrBiRPADT/Hw4ybgM5GyNZxGWxnbFsgX0FSemfmbEj4l2gmeJrC4NJ3EDR0jYxIGk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vY/rDY7Cno6yU4lIxFsKicfG0AtgZ5vMiktMvSN9js=;
 b=BISQ7JfeoA9Pv1LMTPRmykwtDktabtRgoMPURhbI4Bu2kgfVIELZcvmFOEf2gJRQwFodt05WXcuCWVAgdS1YKE1DFueOGJsPxnXR99FAp+NH3g18wfsHr8oNetGmzGPVsvRvfOFxTQ4/jZ37Q/rtBkYszfG2dlh39VbjxsUzrJc=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (20.177.12.140) by
 SG2PR03MB4343.apcprd03.prod.outlook.com (20.178.152.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.20; Wed, 15 Apr 2020 17:14:09 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6%4]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 17:14:09 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Hans de Goede <hdegoede@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [External] Re: RFC: Drm-connector properties managed by another
 driver / privacy screen support
Thread-Topic: [External] Re: RFC: Drm-connector properties managed by another
 driver / privacy screen support
Thread-Index: AQHWEzqRGOF50eGZBkWkqbN2jA9AQ6h6UgAAgAAYP/A=
Date: Wed, 15 Apr 2020 17:14:09 +0000
Message-ID: <SG2PR03MB3324D2E70FF609FA020F6C9EBDDB0@SG2PR03MB3324.apcprd03.prod.outlook.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
In-Reply-To: <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73e8931a-51db-4aea-a7de-08d7e160692e
x-ms-traffictypediagnostic: SG2PR03MB4343:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB4343E48D55469B976C491684BDDB0@SG2PR03MB4343.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(366004)(136003)(396003)(376002)(346002)(53546011)(54906003)(2906002)(86362001)(316002)(110136005)(8676002)(5660300002)(186003)(8936002)(7416002)(81156014)(55016002)(4326008)(71200400001)(64756008)(66946007)(26005)(9686003)(6506007)(7696005)(478600001)(76116006)(33656002)(66476007)(52536014)(107886003)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JYPLkVY+7IrObf7ojBHVRuTXl7SiWQI6cZEz8cklEWzhTDHUUC6nFItTYg6bVT4+GJzzk+iLqS9tEkDW/DTSpkPbB3OYGTeZxthFoO1bteLlhJ3pi4pDrBYUZ1Q1VVOIal8dPFx3d/PqLsAFWVrcIqbO+NkHLBaBmJYuvLK5cBapZxBXNsSlUmfS16vZ2dZTI2jckzxM1Qgkv9kpw4rVzrfkjMKH4kJPk5gp2XXjKctb+k13EWrXvtq6sZUt3/stPomEiRLInNWgNKwMelk0xHiFVa4OtFq5LWFmzzn8GCyQ1JSv9j8d4fqsASCnOuvlNeR6KynGRwjcZ9i11BbJsG0EDklwEMwmNvm5voAViz3WysXel5XEXFv+udinI9mnVVM1bokns9WJNWX1R4GPtlfDp3VTVXwfAImOhREcimmp8tKO2QihAqT30hDRAW33
x-ms-exchange-antispam-messagedata: STfnmrPa9U3ayoLc+JZ432bYA2mLuJx1bHSrHJzicX9I16Ut/GR9D4okjEEWJKzVAg4ELF7oqUaoucNFPXk1yjlKen1N2/qQy41udwpZ6a+sTdTN067UgHP0gRsMcN9snDnnW2UvqYuq2k9cXZljIA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e8931a-51db-4aea-a7de-08d7e160692e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 17:14:09.2000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVGgiQ1eqwQeTjK23eZd2+fJa7Zn2BKj3IYjKNupUNCjunypMTyxCgKIpiNlnVRa3qGiaXdnrX4kUNcCIJkCsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4343
X-OriginatorOrg: lenovo.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Benjamin Berg <bberg@redhat.com>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rajat
 Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Wednesday, April 15, 2020 11:41 AM
> On 4/15/20 5:28 PM, Jani Nikula wrote:
> > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> > Moreover, do we actually need two properties, one which could indicate
> > userspace's desire for the property, and another that tells the hardware
> > state?
> 
> No I do not think so. I would expect there to just be one property,
> I guess that if the state is (partly) firmware controlled then there
> might be a race, but we will need a notification mechanism (*) for
> firmware triggered state changes anyways, so shortly after loosing
> the race userspace will process the notification and it will know
> about it.
> 
> One thing which might be useful is a way to signal that the property
> is read-only in case we ever hit hw where that is the case.
> 
> > I'd so very much like to have no in-kernel/in-firmware shortcuts
> > to enable/disable the privacy screen, and instead have any hardware
> > buttons just be events that the userspace could react to. However I
> > don't think that'll be the case unfortunately.
> 
> In my experience with keyboard-backlight support, we will (unfortunately)
> see a mix and in some case we will get a notification that the firmware
> has adjusted the state, rather then just getting a keypress and
> dealing with that ourselves.  In some cases we may even be able to
> choose, so the fw will deal with it by default but we can ask it
> to just send a key-press.  But I do believe that we can *not* expect
> that we will always just get a keypress for userspace to deal with.
> 
Afraid, the "hotkeys" control for ePrivacy (Fn+D I believe) is very unlikely 
to change - Windows uses it as well...
We can do notification of any hotkey presses to update the DRM layer (and
userspace) if that helps

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
