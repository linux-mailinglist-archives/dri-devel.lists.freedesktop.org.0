Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039F6C025C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 15:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2D010E19A;
	Sun, 19 Mar 2023 14:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1199 seconds by postgrey-1.36 at gabe;
 Sun, 19 Mar 2023 14:21:10 UTC
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net
 [87.98.172.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2710E19A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 14:21:10 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.4.24])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 9D7B523F99
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 13:44:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vk2nn (unknown [10.110.103.232])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A395D1FE33;
 Sun, 19 Mar 2023 13:44:09 +0000 (UTC)
Received: from sk2.org ([37.59.142.105])
 by ghost-submission-6684bf9d7b-vk2nn with ESMTPSA
 id IxRwI6kRF2SLKQEA5A//1w
 (envelope-from <steve@sk2.org>); Sun, 19 Mar 2023 13:44:09 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006adb33e03-d5be-4371-a698-f6a54d8109e0,
 9CCC51F2D7DAB1FB7350B438D1071C8867680B66) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 19 Mar 2023 14:44:08 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Message-ID: <20230319144408.03045c50@heffalump.sk2.org>
In-Reply-To: <2857575f6ec206f79cc21d423fde7d17@protonic.nl>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
 <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
 <Y7qM+ZlG5gQiOW4K@ravnborg.org>
 <2857575f6ec206f79cc21d423fde7d17@protonic.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 1273674272938165894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeludetkeehffejieetveeltddttdeftedtvdegkeffueefvefgieetvddtieehfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 09 Jan 2023 11:12:02 +0100, Robin van der Gracht <robin@protonic.nl>
wrote:
> On 2023-01-08 10:29, Sam Ravnborg wrote:
> > On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote: =20
> >> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
> >> <devnull+sam.ravnborg.org@kernel.org> wrote: =20
> >> >
> >> > Introduce backlight_get_brightness() to simplify logic
> >> > and avoid direct access to backlight properties. =20
> >>=20
> >> Note: Stephen sent this one too a while ago (with some more details in
> >> the commit message, which is always nice); and then he sent yesterday
> >> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
> >> [2]). =20
> > Thanks for the pointers. I will try to move forward with Stephen's
> > patches. =20
> >>=20
> >> Anyway, if it goes via drm-misc, feel free to have my:
> >>=20
> >>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >>=20
> >> Though it would be nice to have Robin test the change. =20
> >=20
> > Robin - can I get your ack to apply Stephen's original v2 patch to
> > drm-misc? =20
>=20
> done! see:=20
> https://lore.kernel.org/lkml/0b16391f997e6ed005a326e4e48f2033@protonic.nl/

As far as I can tell, this never got applied to drm-misc, and I don=E2=80=
=99t see it
anywhere else. I guess it slipped through the cracks ;-)

Regards,

Stephen
