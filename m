Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366F323930
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F1C6E8AF;
	Wed, 24 Feb 2021 09:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8F16E8AB;
 Wed, 24 Feb 2021 09:09:10 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MRnXY-1lPOpV2sAs-00TCfi; Wed, 24 Feb 2021 10:08:27 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 732881E01E7;
 Wed, 24 Feb 2021 09:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wonho7DAe5NY; Wed, 24 Feb 2021 10:08:26 +0100 (CET)
Received: from pflmari.corp.cetitec.com (67-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.67])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id F367C1E01E6;
 Wed, 24 Feb 2021 10:08:25 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Wed, 24 Feb 2021 10:08:25 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDYXiTm7MDXgYT7H@pflmari>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
X-Provags-ID: V03:K1:cGed9gPj+JIzUf3H2cRPnpC8QpnkW70X803lIk1/AQ44QAF3SiG
 g00oP6MNRxFYbzW5J6kmzHnCpI4c/LDd38xnOztL0+JpRVTlNJ+ysrNYIMSQHb8oAhSYPrG
 dMIhKmyX+E84qo9WDcwMMFo5MQai1bLvFCFIoioHlAmS1ZHLwhW+bLLBrylJHWbLeHKhJ20
 vmGWGvRrwXt6K8J4SJBTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7bn3tjKrTjE=:rZQSYL5WOWbhb84kuRdpMs
 Y1NbTu4ibzvvwGDO/ld8k+duIBAKUuVMUTil71dDP/n0iSMt2a9iv5v7n1Q9lv/XFD2psI7yM
 q0g8MLqyWRTks9I95NkXTgRA/0WP+R7nyR8eErOuHgyNu4NB60s66nogT2iR7Y0qPZW6WFvY1
 vWa+TlbEFmORlXryDe0SLeoZR7Sr1+zCAINHL+Fu7PtOkU0rsP8Wpcyat3ysrtSXtbTNa6ItM
 UDs3aogTL8XlBJGle1cbKCvQheUnGR0uG58pc0wXXee3zwUPS2VOTIC26viatLAkqrGE0hGaL
 Xu4B6YM+CzPrb3bBpNJgHXjIEgR86T7yB8y2x1LNjF54vkFE/6GSnI58sAj30dCDQjAEh6ZBT
 ohmnmwKhZwYoqq3H1eqtDexX7JXUyAua3wmS1bkiyBzI1b7FeDStj19HhO9JpmZAhUcPnpRJ4
 evW7IlubQA==
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
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin, Tue, Feb 23, 2021 19:13:59 +0100:
> On Tue, Feb 23, 2021 at 11:23 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> >
> >     $ xrandr  --listproviders
> >     Providers: number : 1
> >     Provider 0: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload crtcs: 4 outputs: 5 associated providers: 0 name:nouveau
> >
> > And yes, the cursor looks good in v5.11 even without reverting the commit.
> 
> FWIW it's not immediately apparent to me what grave error modesetting
> is committing in setting the cursor. The logic looks perfectly
> reasonable. It's not trying to be fancy with rendering the cursor/etc.
> 
> The one thing is that it's using drmModeSetCursor2 which sets the
> hotspot at the same time. But internally inside nouveau I think it
> should work out to the same thing. Perhaps setting the hotspot, or
> something in that path, doesn't quite work for 256x256? [Again, no
> clue what that might be.]
> 
> It might also be worthwhile just testing if the 256x256 cursor works
> quite the way one would want. If you're interested, grab libdrm,
> there's a test called 'modetest', which has an option to enable a
> moving cursor (-c iirc). It's hard-coded to 64x64, so you'll have to
> modify it there too (and probably change the pattern from plain gray
> to any one of the other ones).

I am interested, so I did.

If I start the test without X running, the sprite of 256x256 cursor always
contained horizontal lines across it, both with commit reverted and vanilla
v5.11. Similarly, the 64x64 cursor has no lines across it in both kernels.

The test does not seem to work at all if there is an X server running (using
modesetting driver): modetest complained about permission denied to set the
mode, and just sits there, drawing nothing on the displays.
So I could not run the test in the environment of original problem.
Am I starting it correctly? Is the change in modetest.c correct?

    $ ./modetest -c |grep '^[0-9]\|preferred'
    85	86	connected	LVDS-1         	340x190		13	86
      #0 1920x1080 60.01 1920 2010 2070 2226 1080 1086 1095 1142 152540 flags: phsync, nvsync; type: preferred, driver
    87	89	connected	DP-1           	470x300		18	88, 89
      #0 1680x1050 59.88 1680 1728 1760 1840 1050 1053 1059 1080 119000 flags: phsync, nvsync; type: preferred, driver
    90	0	disconnected	DP-2           	0x0		0	91, 92
    93	95	connected	DP-3           	520x320		10	94, 95
      #0 1920x1200 59.95 1920 1968 2000 2080 1200 1203 1209 1235 154000 flags: phsync, nvsync; type: preferred, driver
    96	0	disconnected	VGA-1          	0x0		0	97

    $ ./modetest -s 85:1920x1080 -s 93:1920x1200 -s 87:1680x1050  -C
    trying to open device 'i915'...failed
    trying to open device 'amdgpu'...failed
    trying to open device 'radeon'...failed
    trying to open device 'nouveau'...done
    setting mode 1920x1080-60.01Hz on connectors 85, crtc 50
    starting cursor

    cursor stopped

This is the change on top of 1225171b (master):

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index fc75383a..cdba7b4e 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1730,14 +1730,14 @@ static void set_cursors(struct device *dev, struct pipe_arg *pipes, unsigned int
 	int ret;
 
 	/* maybe make cursor width/height configurable some day */
-	uint32_t cw = 64;
-	uint32_t ch = 64;
+	uint32_t cw = 256;
+	uint32_t ch = 256;
 
 	/* create cursor bo.. just using PATTERN_PLAIN as it has
 	 * translucent alpha
 	 */
 	bo = bo_create(dev->fd, DRM_FORMAT_ARGB8888, cw, ch, handles, pitches,
-		       offsets, UTIL_PATTERN_PLAIN);
+		       offsets, UTIL_PATTERN_SMPTE);
 	if (bo == NULL)
 		return;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
