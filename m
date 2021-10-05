Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9D422C68
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5CE6F5E3;
	Tue,  5 Oct 2021 15:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F836E418
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 15:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXq/MryW6u1+Pbz9YcDlHfIwZfujzLl9Ekui3lBeg6o0G+sLd+1smVrJPL7lyrBdrJQw5s8WeKfx4GhmWDsaLh4fCDJ5k/oWrUeBi4BhB3HlGEflsXuRK0a2frqbjQCP7PIQrFmkySnlrcMg1LmXJeAUrUGxTxaWeSZQE21dxURu8+OOUQ/7JFi6EwDlvUvoUmgB7kfLMIWX3RwLdI6dW1i6LbER+MpQE+Qn+/DCd0T9sw5TZfVl6MqS8a0/XksQTj2qoqwlhjrAtzIlWSk694YF5guXQhkuqtBbSpNl6fd7T2F1qHXv/HN0piXAvwrHQxBDM+/df6RqHIuaG+PliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR5Y8R2rQ1UvQfRPGu9EUapp3UvttWMjfJOpknNUuJk=;
 b=XNloDyx0SZf/S8RcFGSyWqYixlqvhIT0Q/aHA7qdTxCQBRR5nW+g78gibXicFzOqtaVEVTIKnEworgvOqbj1u5UtvTz28AV8vrnCnGGjkeyWkxQk/crUdbttnk7ZK16zuIBz2fpIHrEhUCd2LhzaG67rCXzJITFmquYXblyKnQD53+PwWNAbao0P4bXgHuJQoXmNLvuhjNT7u85+yQpR+CSNcwn/jetqo3XQXcemN9IAFW8wLk7Eqrm/Td8lNNeg9RPBW8ldChyhCfwF4/cFlgq/cOnzfFDfog6cWMq/yZU3g5tLcb11EGMG/25Iay4gAXObdOA89NLceftgRBvDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR5Y8R2rQ1UvQfRPGu9EUapp3UvttWMjfJOpknNUuJk=;
 b=2Z3hS4l5cTt0Rd9yr5xx3Jcy4wxd3uPT+NpWDZDfIQYIeWV0pwch3+kqaepcP2OqeuJpgu1wLaMlxepYHvvsTFHOjkXDzHiC6XMWrIcIQe2sObj1TW2C4CBwxiR7FpsMcSTDgJoZXgCsmNGcAi15N09wpnHc5Y0Eox1hLqw4HjY=
Received: from DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24)
 by DM6PR12MB3708.namprd12.prod.outlook.com (2603:10b6:5:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 15:25:16 +0000
Received: from DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a]) by DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a%7]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 15:25:16 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: Doug Anderson <dianders@chromium.org>
CC: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, "oliver.sang@intel.com"
 <oliver.sang@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sam
 Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, Kuogee Hsieh <khsieh@codeaurora.org>
Subject: RE: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
Thread-Topic: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
Thread-Index: AQHXufuiB3TntzhJLk2KvcowNJeYQqvEhcmw
Date: Tue, 5 Oct 2021 15:25:16 +0000
Message-ID: <DM6PR12MB4912FFA74D1E7FF4599DA57EE5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVtZstInQxXfPmsZ@intel.com>
 <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
 <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=7d076426-1b3d-4c4e-9918-231b1a7eec37;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-05T15:22:57Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9acf66f3-7517-471a-5a8c-08d98814555d
x-ms-traffictypediagnostic: DM6PR12MB3708:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB37081D9C2B266E7BF54EC23DE5AF9@DM6PR12MB3708.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 17vVdAZSJ40sC68UblO5RNpXWLH7iKU110DPOsXKcUXZxLey4KyLY/vEHWDuasuXYGKCVgC6ouu5EQqctXyG8b7JQOdMKfVNcypoTx8xlilWhgMHq4R1O7KHNuJ5eOGMcma3XaVq0YqdsjUc72nmFa8Dv/gIe8yHL1JH3Gb1cbMjFNYR7vJU9jTWRr+gjFop0+TYltCz1tttZmqK5f/6lOMnb247C6JmO7wODNoG+1YLQaPv2E8gz7IUJs9ffiXyYjFmoDt6pRY0hGY1w/gGHsEKjRFlTDflPilO/4AMTowXYo8O8rhn2tMlHlyKT5GShfpUmrg6od1YlkL0eAvezIFf01O3BGm8IhlqHKlexgXvOdB8fTjl1DIIhj/5Tar3ptKoN7E1CautCuTq7FxqxtcOTGaol7yaAcnFxR0etkXvaiH9VHTZfzdimzYcPGsaa43ecEebVAhk/3CAmFY9nr/6cqnm9awmY4SdfT+p/XyyUooR/Imz7ofrTQldiMOZzMrI2brbrYQ1pijbtsR2BVyPS6SENhzKc32dX+HBWK26TsBI5C+K4IfnGRemT/FOt0WhPJA3N7dnlH6wJCmL1k0ByXv97I99yIDHmUlgIC9OHVGaZv2j+J3veu4smKPDwToLPp0oObEQeuwQXJolryGHzpqwQWqmekchNuXu1R/QXe785WJ2Q/KLGsOz7jR7+ww1QFZr1KP7Z8X/LAxMFZK9QTfNOR2kfmqNJQTuzIia0TIkLIYFfbgUXBGiXdPZ0rHS+/VPxXxY8FMtTHOausYq2YRZDeDSI9DrIpYxhag=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4912.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(9686003)(966005)(45080400002)(53546011)(7696005)(33656002)(54906003)(6506007)(5660300002)(38070700005)(316002)(508600001)(2906002)(8676002)(8936002)(6916009)(66476007)(186003)(76116006)(66446008)(66946007)(86362001)(66556008)(4326008)(64756008)(83380400001)(66574015)(71200400001)(122000001)(52536014)(26005)(55016002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kgiVIpVQmYH6TiZUhUP3mFjmhlt3jMHqE20qh/nOm+VMwqsnRVWPV+5Iqu?=
 =?iso-8859-1?Q?IiLYAQ+zudp/Us/ClGgfo+qBNzKuKikfn+iKi/7yXiBTasmx5ZcTnICUWW?=
 =?iso-8859-1?Q?Fc/wP9gl1tlL/s4P/jsG2Qk5KUTirjSqvopbrsXpWpL/v6vQpslSpA5jy0?=
 =?iso-8859-1?Q?Qchv+cXjDh7TR52zX3GhKGFaO6ZkIC6WdtkuefaNKrtbStuyLz9lIIU4tg?=
 =?iso-8859-1?Q?+Fv4Kn0G9Cd9AE84jijvPc1+q30rg19oFgsCOqPHD0slZToqVgq1k/Gy0x?=
 =?iso-8859-1?Q?tqCPxPLwGrFrEBwLaZO41GZ+yBqODoeHLkqXXKMzItgTST05b1QgiuEpJk?=
 =?iso-8859-1?Q?FP7Ay0im4iSGfdmhaef2xgJoJ5MPA9zv6YWsQfNf2UKj0jZ+9DCbMnGBSn?=
 =?iso-8859-1?Q?FOGZgksMo2emWieCII9KoJDIRiPtA5AEW/o/iEAAn/crBnHXpQx4jq7yrO?=
 =?iso-8859-1?Q?cJTkv8oK2Fhw6oPXc7LaDijX1RB4Er+I9L6QzmnCIs1FlnJyhCc4JPQd8s?=
 =?iso-8859-1?Q?G4ZQjUEUxb1VTXOM7NilgmGNGk1XtRlxrAvm9rob/4ifHbhd4kDLbg8M6+?=
 =?iso-8859-1?Q?UJig82t7Y3z84gOg7wfRVrmIjRwOLJm4i4XnXVCzvkoK11rnkK+iYmrad7?=
 =?iso-8859-1?Q?roEy1orBlz6RbKu0mpP34Ot7pHhxX3jtYLqdN+ULMjRKYgcA4CBHSvX92e?=
 =?iso-8859-1?Q?4VlnMFmdx0239n1t0i/BJNZkUu10ZbnT94RkJZl32csOPS02I0JVtMpPrI?=
 =?iso-8859-1?Q?ODZq2AmTqp5W+BxPaUwIC5WeEkSoGm0bvnEpa+CNESmHavO80/li9Quxk2?=
 =?iso-8859-1?Q?tFnal4sLWX/ESwLNQQYylweZ6G8SLrAlGlTbMwZIOnNK+yGz2wH5AX0G7u?=
 =?iso-8859-1?Q?D/8yd9XSBKeYQKqnF2V3irsljji6QfqUeYZa/pRGrQgMbs9ZEJd6LW+eVn?=
 =?iso-8859-1?Q?gb7QtbKcfR5/p0HH5VZ7/W6m6nvRZygLcUa+LBK/C4JdmzXffx5tqNY6ua?=
 =?iso-8859-1?Q?seEvDO9HKJfxanv5iU+ib9MfI9AX5m3ZWOSNzcyt1iXqL8WJAVkvlqe0QF?=
 =?iso-8859-1?Q?9jC7xEcX9w6OQ5VcT03DntSnFU3WAkoq201Gf7Gz9GPrdZW8pClQAheRM2?=
 =?iso-8859-1?Q?qyukSZQKJh4Dtntm7EZdzndeykI3VvT2zBRBTmzWCLt17+iay3kYd1zs1b?=
 =?iso-8859-1?Q?cJdt3IhaOB78aYs9jQOsU6H4De0Pe2W6uXN4CMfK4WqVaqh+9RreJ3n94o?=
 =?iso-8859-1?Q?wbHtmUjNhlM07Wmhgwripd6+6YXepyuzKEpXWlbIKIRR1lqyQ1rOEMLPWY?=
 =?iso-8859-1?Q?lRH3mcMovWpMfcSo5kwR201zgPEpmdlJ5F8qLEpH/2QDVmaYkMqlAJb1OV?=
 =?iso-8859-1?Q?J4Q2htXdfZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4912.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf66f3-7517-471a-5a8c-08d98814555d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 15:25:16.1355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kw3FuEdJLRohIA5W6mRSG7xTNUo3a6ZY86Hz4jAmZY8tniA25b9B24W1Flo63JZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3708
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

> -----Original Message-----
> From: Doug Anderson <dianders@chromium.org>
> Sent: October 5, 2021 11:14 AM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; dri-
> devel@lists.freedesktop.org; geert@linux-m68k.org; oliver.sang@intel.com;
> Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; Jani Ni=
kula
> <jani.nikula@intel.com>; Linus Walleij <linus.walleij@linaro.org>; Maarte=
n
> Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Sam Ravnborg <sam@ravnborg.org>; Thomas
> Zimmermann <tzimmermann@suse.de>; linux-kernel@vger.kernel.org;
> Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Kuogee Hsieh <khsieh@codeaurora.org>
> Subject: Re: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid:
> Fix crash with zero/invalid EDID)
>
> Hi,
>
> On Tue, Oct 5, 2021 at 6:33 AM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
> >
> > > BTW I believe connector_bad_edid() itself is broken since commit
> > > e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
> > > corruption test"). Before we've even allocated the memory for the
> > > extension blocks that code now assumes edid[0x7e] is to be 100%
> > > trusted and goes and calculates the checksum on a block based on
> > > that. So that's likely going to be pointing somewhere beyond the
> > > base block into memory we've not even allocated. So anyone who
> > > wanted could craft a bogus EDID and maybe get something interesting t=
o
> happen.
> > >
> > > Would be good if someone could fix that while at it. Or just revert
> > > the offending commit if there is no simple solution immediately in si=
ght.
> > >
> > > The fact that we're parsing entirely untrustworthy crap in the
> > > kernel always worries me. Either we need super careful review of all
> > > relevant code, and/or we need to think about moving the parser out of
> the kernel.
> > > I was considering playing around with the usermode helper stuff.
> > > IIRC there is a way to embed the userspace binary into the kernel
> > > and just fire it up when needed. But so far it's been the usual -ENOT=
IME
> for me...
> > >
> > [AMD Official Use Only]
> >
> > Hi Ville:
> >
> >      Yhea, it is pretty old change from two years ago, and it is no lon=
g valid
> anymore. Please simply drop it.
> >
> > Regards,
> > Jerry
>
> I've cut out other bits from this email and changed the subject line sinc=
e I
> think this is an issue unrelated to the one my original patch was fixing.
>
> I don't actually know a ton about DP compliance testing, but I attempted =
to
> try to be helpful and revert commit e11f5bd8228f ("drm:
> Add support for DP 1.4 Compliance edid corruption test"). It wasn't too h=
ard
> to deal with the conflicts in the revert itself, but then things didn't c=
ompile
> because there are two places that use `real_edid_checksum` and that goes
> away if I revert the patch.
>
> I've made an attempt to fix the problem by just adding a bounds check.
> Perhaps you can see if that looks good to you:
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fr%2F20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1
> 295928d%40changeid&amp;data=3D04%7C01%7CJerry.Zuo%40amd.com%7C90
> b948659454400cedd308d98812c339%7C3dd8961fe4884e608e11a82d994e183d
> %7C0%7C0%7C637690436453163864%7CUnknown%7CTWFpbGZsb3d8eyJWIj
> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1
> 000&amp;sdata=3DOtSngWlYyDc1NbNSgAeALqN3nF%2Bnw08nJ068cpAKZJk%3
> D&amp;reserved=3D0
>
> -Doug

The patch used for DP1.4 compliance edid corruption test. Let me double che=
ck if edid corruption test could be passed without the patch.
