Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80954814E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3A10E7C4;
	Mon, 13 Jun 2022 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC48510E7BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 08:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARjkgtb1NiuYGuZPmE4WW/+//HVEN6TJQKK+ak//qqW+gozv0NwdJLrQ40/s+0sE58vk6APm5LkZxtz4l4/gqK76gtwpbWFBUUJAhYsAxeBBE+uGlfzlUpziQHq9SJQ08H91lQbV914lD8jAH37eAjiK3VPWWzg7Amaxk9dAnEzP9nFspyYNDSoS8/UO8BxV4/RJ0qsioPCNbcT5rus613ywA2YZAw/E4zd+2TJrbRSyos49frBasgsrAPynGs/twZi6IAEstKZrnep+zaFs2b9NEAG8lR3Kn2eM5Qq/eCZ0T9NO8l73uXSyzEovCBs8jrYIPgfMw6cKRdJAdquH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjJfZKh2WXgiC5lUN4T8cuc0QXSG1isfGzqfniuExoA=;
 b=bhecJW3jYNc6UL0PrD+dt/vEOdv4z/geQ16jk4U+5w5NhYDHVLDqZplI+gDtrytchlukAvlugqpBUZ+2KHt/u2meWnLsrD8+HshwTjmbN1LnrXDEPJFoyfuSlhSaFd6RxE3PqvyFkPbUAReJkx03Ue3Ejt+N8UEqdmuHRYeQ9VSdrJaerSPMsSIC270g/N+G0qDoH5Cs0rz55mpea9wptqYr4KMTL/eBd/OyZeK0+Pc4jreOG5jQFUztEp7Z66ahhFKAKaQ48uX1O/CZyJPVga6GkJNhFFDta93XUNQPPqahsnHYd+/gAPh+NmDuVozMCnr4Nil/5UMjzZI+tJsKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjJfZKh2WXgiC5lUN4T8cuc0QXSG1isfGzqfniuExoA=;
 b=xO929ev/W8Jjhs7cJ5vFId3kSNlGV9hGe0JTRAGLfOXi/dMFXjkLGLwMBQsE0vUf3K3gXMjEPptFmQOPQnhQ64RAnUw6L/YdusQ5wbJeFmEVdZ7bv1VBc6peWUkWBKZacwJ7ULDHRSM044qT/Lx1Zx1ifjv6aRjUrxZePVHyN8Y=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 08:11:08 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 08:11:08 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "20220613042707.8525-1-william.tseng@intel.com"
 <20220613042707.8525-1-william.tseng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v2] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYft3h33YnfcZSXUW8Nr4KMwdTEK1M4uFwgAAYEwCAAACXAA==
Date: Mon, 13 Jun 2022 08:11:07 +0000
Message-ID: <CO6PR12MB5489FDBE7FB74100BF2126A2FCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <20220613042707.8525-1-william.tseng@intel.com>
 <CO6PR12MB5489D1366E44E62AFE5A104AFCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <SJ0PR11MB58945B1FED80408B829D6D06F1AB9@SJ0PR11MB5894.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB58945B1FED80408B829D6D06F1AB9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-13T08:11:04Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=c1aae2c1-cf27-48bf-a166-63100ffaa320;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 378d00d9-1b96-4622-7706-08da4d14450c
x-ms-traffictypediagnostic: CO6PR12MB5441:EE_
x-microsoft-antispam-prvs: <CO6PR12MB54416728B24E6D127C47744AFCAB9@CO6PR12MB5441.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qdLkSCfP83GPwJ+rl6DEsmcsnCI1H7MKy4XTbZNLdjWyQhTyZoLqGUYrEamQkTen9DM21EmYwA7bPxzP4AX0TspzfAUKCqPVKTYG1v4/B4vooXc+K3eIe0N9igjybQxmNkxmQhX6LIepBAX/zeNr3MFbwUvuxI6G8uGX8Xo+sXvDOWDiM/3aTgxZwrI7qgBY2rH8cew9I1e+nh54Ck05nK/lIxuNpolOHKPz6/YxOxufL2YAOS3xMOWWVvvFRy20MlUM2U99AE/i7oaNLEPp17gWYQG4dU3nTLA6Lik+Uw0Hq++abuHKU7ttDA3iZ9yNapKPIAti56rlxYy3fMf4bVnwuxnH7O5IFD55k42XB6na2hKDZbuF5WyuGV0e/7gEUjjBMAb0pd7Ucy/ZAZNPdUEpl50bNOTbJGy3LwYKMvRMNWKuoY1lQr0kNqVyWvo/hBn9iaNTmV4xAsJAGHcXK8PlFW+BNoehp8p0fLFNIEF0P3zCd0nK7y88iJ/RY8vfUEMUnWtfODlZqqQnFAZTSEiyhFgvQBIMtf9pz3Xd9+4sI0y1Wer127R3/QD6v2Ct4cIs4R049AV7WG7lqc8OvkjXPSCnlHfktYRhHm6UB8mQPo7xy3g/ZtnUoqqUPyp4Tp9jL0Ecs6uw2jCF4fX/BwOwXgCLHFzJpmjCe626w3s8aVh6kBEnndz7UEZfcZ/5MI+FiaiEo57d5ryPP/Pqpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(55016003)(5660300002)(508600001)(83380400001)(110136005)(71200400001)(86362001)(66946007)(76116006)(66556008)(66476007)(64756008)(8676002)(316002)(4326008)(66446008)(54906003)(52536014)(8936002)(122000001)(186003)(66574015)(38100700002)(9686003)(33656002)(53546011)(7696005)(26005)(6506007)(38070700005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+79C1AFRy4FAlNnD+XI1xHDeZiadOoyRYxk1aKGkq9Yy0CGwyEIIrMB+A5?=
 =?iso-8859-1?Q?ia7e5DXKCMCDW3JrSph5rJYp3g33CNSjnOkiz++gtvWgpWXS2L+ib1tLB0?=
 =?iso-8859-1?Q?DUREmoJfzzMi/CVrOmRF9tmPeet4FXtNVdYGDfE2ktYHj4DuAU6VySLsgv?=
 =?iso-8859-1?Q?uRx9ro6jTNJFI78owFQWurN+9tEOrYvR+f3SsuqMGCgxjQxlr8hoPP+B53?=
 =?iso-8859-1?Q?xaOVefMoAxuh2wxyeBTGw3utyfdbt3VSk83lYBJs7CEqvTZzl0AvvXeJul?=
 =?iso-8859-1?Q?0SO/FasgtY8bu6ge0hDZJ12ctUWMIeVnjOItU0xdbDtW6J/ZEc5JAWqLnC?=
 =?iso-8859-1?Q?vTpW4caMK1NHH4S4gizPQv9uDgXrObARJPdQCXivo4mSznnAQDjF13bcmH?=
 =?iso-8859-1?Q?G9l1ZsFAXveWwB6c/rHyaYtyctwFHwWNSzid10nhLKBkEj2KYUt328mers?=
 =?iso-8859-1?Q?WDHfDhh4+6KbWq9Buus3cywLwOjf7O3wxAPiHt002bfwlFeQg20l0py/Xk?=
 =?iso-8859-1?Q?l+W4GHE3A278pX2IM+emp1tsS2EvBvu40ZrXj9MBEz2Mz+3iMvJMSp2Khj?=
 =?iso-8859-1?Q?/+viFO/Fnd4QzYZVLqlccR+enS4KRmKJbjUAr39bl7oSQMoBggq2DlS8a7?=
 =?iso-8859-1?Q?Qq/JNuhsS7l9QWFs67NDUCwYh1Hbr4eorbJVgKG2fUUohbt1YunizKDkV8?=
 =?iso-8859-1?Q?tjd/6kdrwAb6FO8tGPwMj3miawmhpZcHMuGqwaS8L0qxsYIp2Cl0xdgS8g?=
 =?iso-8859-1?Q?NUR+Mpr7mPXHy37Teh+NZQbk69/VhKuKPGhgpqu+kCDoCwJOpsAtKEmqoF?=
 =?iso-8859-1?Q?nipV1vS4bof5y6elszXKIrqxGClEoRxBLn1HGabc1hj7OAt1ALzom8XnUt?=
 =?iso-8859-1?Q?4uXh08kENICZdRneV0ZZvhg/dzFlyAbOnBnGtnB98JhFSrveaBBnOdht20?=
 =?iso-8859-1?Q?xCCPQAoxAOKrm4ntIQy9gL+eVRn6evQsqFP5oW7p970WOSr0MAkFHHDxy5?=
 =?iso-8859-1?Q?wdAPNKCLAtj3Yn089E3VAHbV+gJCqdblMks11N0G9fzxV0Tgfwm1Ic1jQB?=
 =?iso-8859-1?Q?GsjcbUPTUNRsM8ZENErFwaqSdRL24D+Bgq4oNB5rk0LPtkxsvuqhULJeXE?=
 =?iso-8859-1?Q?cw3KKvtRWcN55tBkzifw4tym44hqYQjYwYjBawTUY0oVrnJmyPHG7qKZDd?=
 =?iso-8859-1?Q?MC6Bw0neON5w1hif5bBwXDjLtAByMR7Ue1J6/QsbPNNxMynF9vdB14MxrD?=
 =?iso-8859-1?Q?w51p1mCqoWOFiWmewOmrvTc33NqyLJ9KjhnfcwE29dXgZejaqkKcSXd0SL?=
 =?iso-8859-1?Q?R1TEw5LzXSOTEiI8OuNiMXa9xnaKHJSI7Qi//zW8MSFlTNN5xsHNlNouYz?=
 =?iso-8859-1?Q?7IPqpoPyrtnkzfgLyG/Suzzd7xJ1JCqljNtjJiyZEeqLqraf4GOGC9v52C?=
 =?iso-8859-1?Q?82ChFRMMwNnuVnfkxRHP9KCU4fKDIsgMO0QN6lWcUF6NBVBsgtSbs9JBXw?=
 =?iso-8859-1?Q?j5sMC6zbYe3Ep+Rc2mBV5lFctMw+ec3mH545XwmF9bdoQU3NXZu4Bm5YeD?=
 =?iso-8859-1?Q?jcyE/ON4++yj7c8oK40uH4MciTw4skraBOGhdy91KRYunKiDz3pypB8BOI?=
 =?iso-8859-1?Q?Xvb9VrnRDU9FFQCpV7ZCCzK6Ch1DtePGa7lC+XmlPBqvfOKYCyTzG4r4A9?=
 =?iso-8859-1?Q?qTu0vZEyc400Gpt2w7LcuraZIJtVn9Jri59Mu0skEytmHKcsJoqUUsWm+f?=
 =?iso-8859-1?Q?ybXS1VJ00yY/dhiwFFDwNAyjFUor8UhwpohMNnTQpFFSW0a6jsF6NMkZRe?=
 =?iso-8859-1?Q?N5krdUH5Pw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378d00d9-1b96-4622-7706-08da4d14450c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 08:11:07.8851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NuUOACLY1R3bmTPEFopdyDuhDbowGH1e6fQxc40tgxWMonUWBY0QpIXCSocj1+xr1AJQyHw4sTvWJylutlF7Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Tseng, William <william.tseng@intel.com>
> Sent: Monday, June 13, 2022 4:05 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Jani Nikula
> <jani.nikula@linux.intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>
> Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA=
-
> 861-D
>=20
> Thanks Wayne for the comment.
> I don't quite understand what the typos are.
> Could you elaborate on them?
> Thank you.
>=20
> -----Original Message-----
> From: Lin, Wayne <Wayne.Lin@amd.com>
> Sent: Monday, June 13, 2022 3:25 PM
> To: Tseng, William <william.tseng@intel.com>; dri-
> devel@lists.freedesktop.org
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Jani Nikula
> <jani.nikula@linux.intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>
> Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA=
-
> 861-D
>=20
> [AMD Official Use Only - General]
>=20
> Thanks William!
>=20
> After fixing few typos below, feel free to add:
>=20
> Acked-by: Wayne Lin <Wayne.Lin@amd.com>
>=20
> > -----Original Message-----
> > From: William Tseng <william.tseng@intel.com>
> > Sent: Monday, June 13, 2022 12:27 PM
> > To: dri-devel@lists.freedesktop.org
> > Cc: William Tseng <william.tseng@intel.com>; Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com>; Jani Nikula
> > <jani.nikula@linux.intel.com>; Lin, Wayne <Wayne.Lin@amd.com>; Lee
> > Shawn C <shawn.c.lee@intel.com>
> > Subject: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-
> > 861-D
> >
> > This is a workaround for HDMI 1.4 sink which has a CEA mode with
> > higher vic than what is defined in CEA-861-D.
> >
> > As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
> > displayed and the video format is indicated by both SVD (with vic 90
> > and pictuure aspect ratio 64:27) and DTD.  When connecting to such

Hi William,
Change "pictuure aspect ratio" to "picture aspect ratio ".

> > sink, source
>=20
> Typo - picture
> > can't output the video format in SVD because an error is returned by
> > drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the
> > infoframe with pictuure aspect ratio 64:27 and the vic, which is

Same here.

> > originally 90
>=20
> Typo - picture
> > and is changed to 0 by drm_mode_cea_vic().
> >
> > To work around it, do not set the vic 0 so the corresponding mode may
> > be accepted in drm_hdmi_avi_infoframe_from_display_mode() and be
> > dispalyed.
> >
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Wayne Lin <waynelin@amd.com>
> > Cc: Lee Shawn C <shawn.c.lee@intel.com>
> > Signed-off-by: William Tseng <william.tseng@intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index bc43e1b32092..a4582627ec9d 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -5876,7 +5876,8 @@ static u8 drm_mode_hdmi_vic(const struct
> > drm_connector *connector,  }
> >
> >  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
> > -			   const struct drm_display_mode *mode)
> > +			   const struct drm_display_mode *mode,
> > +			   bool is_hdmi2_sink)
> >  {
> >  	u8 vic;
> >
> > @@ -5896,7 +5897,7 @@ static u8 drm_mode_cea_vic(const struct
> > drm_connector *connector,
> >  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
> >  	 * have to make sure we dont break HDMI 1.4 sinks.
> >  	 */
> > -	if (!is_hdmi2_sink(connector) && vic > 64)
> > +	if (!is_hdmi2_sink && vic > 64)
> >  		return 0;
> >
> >  	return vic;
> > @@ -5927,7 +5928,7 @@
> > drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe
> > *frame,
> >  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> >  		frame->pixel_repeat =3D 1;
> >
> > -	vic =3D drm_mode_cea_vic(connector, mode);
> > +	vic =3D drm_mode_cea_vic(connector, mode, true);
> >  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
> >
> >  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -
> > 5971,7 +5972,8 @@ drm_hdmi_avi_infoframe_from_display_mode(struct
> > hdmi_avi_infoframe *frame,
> >  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
> >  	}
> >
> > -	frame->video_code =3D vic;
> > +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
> > +						is_hdmi2_sink(connector));
> >  	frame->picture_aspect =3D picture_aspect;
> >  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
> >  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;
> > --
> > 2.17.1
--
Regards,
Wayne Lin
