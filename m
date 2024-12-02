Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7289DFE6F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9F010E179;
	Mon,  2 Dec 2024 10:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ap02JDsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847210E179
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:13:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76E695C68FA;
 Mon,  2 Dec 2024 10:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B490DC4CED1;
 Mon,  2 Dec 2024 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733134380;
 bh=GUtK6g0wYFpyQro5lSu/sf7XWXuHBj/A49iyuAXpteU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ap02JDsdjQzES8tUED9gIO+PICybq5yhAxYrrxToa2NDmOI4eoTj3BvvDVBK01mIq
 /dOfFcAEDgF15M7ODX0fM2TknweBTnhdZFISyJfRBw5D713nULPrnzpGHWLo+Jk36G
 2a8RJVVDVr68ezV9OSWZYxfAyXl+NoDC8iKIl/Bpnr0tDJ+IbmGiDeAbVZu9k2TIkm
 G+osy9Z74weK8MREA9nPjIPg/f/NxQ6OLtYStEKKlPyItFyIyAuzsA7sBvfgyB35ZT
 +vFAkj+dUU6/OFarJd/8wa81v4vMW0kFHTOgGNq06KiLbIPzi+VhXnlkgngo+CeqEw
 hNN3pHX0surQA==
Date: Mon, 2 Dec 2024 11:12:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/bridge: panel: Use devm_drm_bridge_add()
Message-ID: <20241202-diligent-uptight-gibbon-da8ff4@houat>
References: <20241009052402.411978-1-fshao@chromium.org>
 <20241024-stalwart-bandicoot-of-music-bc6b29@houat>
 <CAC=S1niZuiJkWBvci+bmrU-BvahhXyWWAYAMOB200a3Ppu=rTg@mail.gmail.com>
 <20241114-gray-corgi-of-youth-f992ec@houat>
 <CAGXv+5EmVj6S2iioYgMKvY8NM3_jzCDS9-GC-GOMU44j0ikmKA@mail.gmail.com>
 <20241129-meticulous-pumpkin-echidna-dff6df@houat>
 <d47e57c2-271a-4ed6-8e00-bb1a84b7b3f6@linux.dev>
 <20241129-blazing-granite-beetle-e9fecd@houat>
 <4a2396cd-9c17-4a4f-90b8-d28a03120842@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n47u4sjvb2gewrzg"
Content-Disposition: inline
In-Reply-To: <4a2396cd-9c17-4a4f-90b8-d28a03120842@linux.dev>
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


--n47u4sjvb2gewrzg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH] drm/bridge: panel: Use devm_drm_bridge_add()
MIME-Version: 1.0

On Fri, Nov 29, 2024 at 11:24:18PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2024/11/29 22:54, Maxime Ripard wrote:
> > On Fri, Nov 29, 2024 at 10:12:02PM +0800, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> > > On 2024/11/29 18:51, Maxime Ripard wrote:
> > > > On Wed, Nov 27, 2024 at 05:58:31PM +0800, Chen-Yu Tsai wrote:
> > > > > Revisiting this thread since I just stepped on the same problem o=
n a
> > > > > different device.
> > > > >=20
> > > > > On Thu, Nov 14, 2024 at 9:12=E2=80=AFPM Maxime Ripard <mripard@ke=
rnel.org> wrote:
> > > > > > On Tue, Oct 29, 2024 at 10:53:49PM +0800, Fei Shao wrote:
> > > > > > > On Thu, Oct 24, 2024 at 8:36=E2=80=AFPM Maxime Ripard <mripar=
d@kernel.org> wrote:
> > > > > > > > On Wed, Oct 09, 2024 at 01:23:31PM +0800, Fei Shao wrote:
> > > > > > > > > In the mtk_dsi driver, its DSI host attach callback calls
> > > > > > > > > devm_drm_of_get_bridge() to get the next bridge. If that =
next bridge is
> > > > > > > > > a panel bridge, a panel_bridge object is allocated and ma=
naged by the
> > > > > > > > > panel device.
> > > > > > > > >=20
> > > > > > > > > Later, if the attach callback fails with -EPROBE_DEFER fr=
om subsequent
> > > > > > > > > component_add(), the panel device invoking the callback a=
t probe time
> > > > > > > > > also fails, and all device-managed resources are freed ac=
cordingly.
> > > > > > > > >=20
> > > > > > > > > This exposes a drm_bridge bridge_list corruption due to t=
he unbalanced
> > > > > > > > > lifecycle between the DSI host and the panel devices: the=
 panel_bridge
> > > > > > > > > object managed by panel device is freed, while drm_bridge=
_remove() is
> > > > > > > > > bound to DSI host device and never gets called.
> > > > > > > > > The next drm_bridge_add() will trigger UAF against the fr=
eed bridge list
> > > > > > > > > object and result in kernel panic.
> > > > > > > > >=20
> > > > > > > > > This bug is observed on a MediaTek MT8188-based Chromeboo=
k with MIPI DSI
> > > > > > > > > outputting to a DSI panel (DT is WIP for upstream).
> > > > > > > > >=20
> > > > > > > > > As a fix, using devm_drm_bridge_add() with the panel devi=
ce in the panel
> > > > > > > > > path seems reasonable. This also implies a chain of poten=
tial cleanup
> > > > > > > > > actions:
> > > > > > > > >=20
> > > > > > > > > 1. Removing drm_bridge_remove() means devm_drm_panel_brid=
ge_release()
> > > > > > > > >      becomes hollow and can be removed.
> > > > > > > > >=20
> > > > > > > > > 2. devm_drm_panel_bridge_add_typed() is almost emptied ex=
cept for the
> > > > > > > > >      `bridge->pre_enable_prev_first` line. Itself can be =
also removed if
> > > > > > > > >      we move the line into drm_panel_bridge_add_typed(). =
(maybe?)
> > > > > > > > >=20
> > > > > > > > > 3. drm_panel_bridge_add_typed() now calls all the needed =
devm_* calls,
> > > > > > > > >      so it's essentially the new devm_drm_panel_bridge_ad=
d_typed().
> > > > > > > > >=20
> > > > > > > > > 4. drmm_panel_bridge_add() needs to be updated accordingl=
y since it
> > > > > > > > >      calls drm_panel_bridge_add_typed(). But now there's =
only one bridge
> > > > > > > > >      object to be freed, and it's already being managed b=
y panel device.
> > > > > > > > >      I wonder if we still need both drmm_ and devm_ versi=
on in this case.
> > > > > > > > >      (maybe yes from DRM PoV, I don't know much about the=
 context)
> > > > > > > > >=20
> > > > > > > > > This is a RFC patch since I'm not sure if my understandin=
g is correct
> > > > > > > > > (for both the fix and the cleanup). It fixes the issue I =
encountered,
> > > > > > > > > but I don't expect it to be picked up directly due to the=
 redundant
> > > > > > > > > commit message and the dangling devm_drm_panel_bridge_rel=
ease().
> > > > > > > > > I plan to resend the official patch(es) once I know what =
I supposed to
> > > > > > > > > do next.
> > > > > > > > >=20
> > > > > > > > > For reference, here's the KASAN report from the device:
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >    BUG: KASAN: slab-use-after-free in drm_bridge_add+0x98=
/0x230
> > > > > > > > >    Read of size 8 at addr ffffff80c4e9e100 by task kworke=
r/u32:1/69
> > > > > > > > >=20
> > > > > > > > >    CPU: 1 UID: 0 PID: 69 Comm: kworker/u32:1 Not tainted =
6.12.0-rc1-next-20241004-kasan-00030-g062135fa4046 #1
> > > > > > > > >    Hardware name: Google Ciri sku0/unprovisioned board (D=
T)
> > > > > > > > >    Workqueue: events_unbound deferred_probe_work_func
> > > > > > > > >    Call trace:
> > > > > > > > >     dump_backtrace+0xfc/0x140
> > > > > > > > >     show_stack+0x24/0x38
> > > > > > > > >     dump_stack_lvl+0x40/0xc8
> > > > > > > > >     print_report+0x140/0x700
> > > > > > > > >     kasan_report+0xcc/0x130
> > > > > > > > >     __asan_report_load8_noabort+0x20/0x30
> > > > > > > > >     drm_bridge_add+0x98/0x230
> > > > > > > > >     devm_drm_panel_bridge_add_typed+0x174/0x298
> > > > > > > > >     devm_drm_of_get_bridge+0xe8/0x190
> > > > > > > > >     mtk_dsi_host_attach+0x130/0x2b0
> > > > > > > > >     mipi_dsi_attach+0x8c/0xe8
> > > > > > > > >     hx83102_probe+0x1a8/0x368
> > > > > > > > >     mipi_dsi_drv_probe+0x6c/0x88
> > > > > > > > >     really_probe+0x1c4/0x698
> > > > > > > > >     __driver_probe_device+0x160/0x298
> > > > > > > > >     driver_probe_device+0x7c/0x2a8
> > > > > > > > >     __device_attach_driver+0x2a0/0x398
> > > > > > > > >     bus_for_each_drv+0x198/0x200
> > > > > > > > >     __device_attach+0x1c0/0x308
> > > > > > > > >     device_initial_probe+0x20/0x38
> > > > > > > > >     bus_probe_device+0x11c/0x1f8
> > > > > > > > >     deferred_probe_work_func+0x80/0x250
> > > > > > > > >     worker_thread+0x9b4/0x2780
> > > > > > > > >     kthread+0x274/0x350
> > > > > > > > >     ret_from_fork+0x10/0x20
> > > > > > > > >=20
> > > > > > > > >    Allocated by task 69:
> > > > > > > > >     kasan_save_track+0x40/0x78
> > > > > > > > >     kasan_save_alloc_info+0x44/0x58
> > > > > > > > >     __kasan_kmalloc+0x84/0xa0
> > > > > > > > >     __kmalloc_node_track_caller_noprof+0x228/0x450
> > > > > > > > >     devm_kmalloc+0x6c/0x288
> > > > > > > > >     devm_drm_panel_bridge_add_typed+0xa0/0x298
> > > > > > > > >     devm_drm_of_get_bridge+0xe8/0x190
> > > > > > > > >     mtk_dsi_host_attach+0x130/0x2b0
> > > > > > > > >     mipi_dsi_attach+0x8c/0xe8
> > > > > > > > >     hx83102_probe+0x1a8/0x368
> > > > > > > > >     mipi_dsi_drv_probe+0x6c/0x88
> > > > > > > > >     really_probe+0x1c4/0x698
> > > > > > > > >     __driver_probe_device+0x160/0x298
> > > > > > > > >     driver_probe_device+0x7c/0x2a8
> > > > > > > > >     __device_attach_driver+0x2a0/0x398
> > > > > > > > >     bus_for_each_drv+0x198/0x200
> > > > > > > > >     __device_attach+0x1c0/0x308
> > > > > > > > >     device_initial_probe+0x20/0x38
> > > > > > > > >     bus_probe_device+0x11c/0x1f8
> > > > > > > > >     deferred_probe_work_func+0x80/0x250
> > > > > > > > >     worker_thread+0x9b4/0x2780
> > > > > > > > >     kthread+0x274/0x350
> > > > > > > > >     ret_from_fork+0x10/0x20
> > > > > > > > >=20
> > > > > > > > >    Freed by task 69:
> > > > > > > > >     kasan_save_track+0x40/0x78
> > > > > > > > >     kasan_save_free_info+0x58/0x78
> > > > > > > > >     __kasan_slab_free+0x48/0x68
> > > > > > > > >     kfree+0xd4/0x750
> > > > > > > > >     devres_release_all+0x144/0x1e8
> > > > > > > > >     really_probe+0x48c/0x698
> > > > > > > > >     __driver_probe_device+0x160/0x298
> > > > > > > > >     driver_probe_device+0x7c/0x2a8
> > > > > > > > >     __device_attach_driver+0x2a0/0x398
> > > > > > > > >     bus_for_each_drv+0x198/0x200
> > > > > > > > >     __device_attach+0x1c0/0x308
> > > > > > > > >     device_initial_probe+0x20/0x38
> > > > > > > > >     bus_probe_device+0x11c/0x1f8
> > > > > > > > >     deferred_probe_work_func+0x80/0x250
> > > > > > > > >     worker_thread+0x9b4/0x2780
> > > > > > > > >     kthread+0x274/0x350
> > > > > > > > >     ret_from_fork+0x10/0x20
> > > > > > > > >=20
> > > > > > > > >    The buggy address belongs to the object at ffffff80c4e=
9e000
> > > > > > > > >     which belongs to the cache kmalloc-4k of size 4096
> > > > > > > > >    The buggy address is located 256 bytes inside of
> > > > > > > > >     freed 4096-byte region [ffffff80c4e9e000, ffffff80c4e=
9f000)
> > > > > > > > >=20
> > > > > > > > >    The buggy address belongs to the physical page:
> > > > > > > > >    head: order:3 mapcount:0 entire_mapcount:0 nr_pages_ma=
pped:0 pincount:0
> > > > > > > > >    flags: 0x8000000000000040(head|zone=3D2)
> > > > > > > > >    page_type: f5(slab)
> > > > > > > > >    page: refcount:1 mapcount:0 mapping:0000000000000000
> > > > > > > > >    index:0x0 pfn:0x104e98
> > > > > > > > >    raw: 8000000000000040 ffffff80c0003040 dead00000000012=
2 0000000000000000
> > > > > > > > >    raw: 0000000000000000 0000000000040004 00000001f500000=
0 0000000000000000
> > > > > > > > >    head: 8000000000000040 ffffff80c0003040 dead0000000001=
22 0000000000000000
> > > > > > > > >    head: 0000000000000000 0000000000040004 00000001f50000=
00 0000000000000000
> > > > > > > > >    head: 8000000000000003 fffffffec313a601 ffffffffffffff=
ff 0000000000000000
> > > > > > > > >    head: 0000000000000008 0000000000000000 00000000ffffff=
ff 0000000000000000
> > > > > > > > >    page dumped because: kasan: bad access detected
> > > > > > > > >=20
> > > > > > > > >    Memory state around the buggy address:
> > > > > > > > >     ffffff80c4e9e000: fa fb fb fb fb fb fb fb fb fb fb fb=
 fb fb fb fb
> > > > > > > > >     ffffff80c4e9e080: fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb fb fb
> > > > > > > > >    >ffffff80c4e9e100: fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb fb fb
> > > > > > > > >                       ^
> > > > > > > > >     ffffff80c4e9e180: fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb fb fb
> > > > > > > > >     ffffff80c4e9e200: fb fb fb fb fb fb fb fb fb fb fb fb=
 fb fb fb fb
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > > > > > > I was looking at the driver to try to follow your (awesome =
btw, thanks)
> > > > > > > > commit log, and it does have a quite different structure co=
mpared to
> > > > > > > > what we recommend.
> > > > > > > >=20
> > > > > > > > Would following
> > > > > > > > https://docs.kernel.org/gpu/drm-kms-helpers.html#special-ca=
re-with-mipi-dsi-bridges
> > > > > > > > help?
> > > > > > > Hi Maxime,
> > > > > > >=20
> > > > > > > Thank you for the pointer.
> > > > > > > I read the suggested pattern in the doc and compared it with =
the
> > > > > > > drivers. If I understand correctly, both the MIPI-DSI host an=
d panel
> > > > > > > drivers follow the instructions:
> > > > > > >=20
> > > > > > > 1. The MIPI-DSI host driver must run mipi_dsi_host_register()=
 in its probe hook.
> > > > > > >      >> drm/mediatek/mtk_dsi.c runs mipi_dsi_host_register() =
in the probe hook.
> > > > > > > 2. In its probe hook, the bridge driver must try to find its =
MIPI-DSI
> > > > > > > host, register as a MIPI-DSI device and attach the MIPI-DSI d=
evice to
> > > > > > > its host.
> > > > > > >      >> drm/panel/panel-himax-hx83102.c follows and runs
> > > > > > > mipi_dsi_attach() at the end of probe hook.
> > > > > > > 3. In its struct mipi_dsi_host_ops.attach hook, the MIPI-DSI =
host can
> > > > > > > now add its component.
> > > > > > >      >> drm/mediatek/mtk_dsi.c calls component_add() in the a=
ttach callback.
> > > > > > >=20
> > > > > > > Could you elaborate on the "different structures" you mention=
ed?
> > > > > > Yeah, you're right, sorry.
> > > > > >=20
> > > > > > > To clarify my point: the issue is that component_add() may re=
turn
> > > > > > > -EPROBE_DEFER if the component (e.g. DSI encoder) is not read=
y,
> > > > > > > causing the panel bridge to be removed. However, drm_bridge_r=
emove()
> > > > > > > is bound to MIPI-DSI host instead of panel bridge, which owns=
 the
> > > > > > > actual list_head object.
> > > > > > >=20
> > > > > > > This might be reproducible with other MIPI-DSI host + panel
> > > > > > > combinations by forcibly returning -EPROBE_DEFER in the host =
attach
> > > > > > > hook (verification with another device is needed), so the fix=
 may be
> > > > > > > required in drm/bridge/panel.c.
> > > > > > Yeah, I think you're just hitting another bridge lifetime issue=
, and
> > > > > > it's not the only one unfortunately. Tying the bridge structure=
 lifetime
> > > > > > itself to the device is wrong, it should be tied to the DRM dev=
ice
> > > > > > lifetime instead.
> > > > > I think the more immediate issue is that the bridge object's life=
time
> > > > > and drm_bridge_add/remove are inconsistent when devm_drm_of_get_b=
ridge()
> > > > > or drmm_of_get_bridge() are used.
> > > > >=20
> > > > > These helpers tie the bridge add/removal to the device or drm_dev=
ice
> > > > > passed in, but internally they call down to drm_panel_bridge_add_=
typed()
> > > > > which allocates the bridge object tied to the panel device.
> > > > > > But then, the discussion becomes that bridges typically probe o=
utside of
> > > > > > the "main" DRM device probe path, so you don't have access to t=
he DRM
> > > > > > device structure until attach at best.
> > > > > >=20
> > > > > > That's why I'm a bit skeptical about your patch. It might worka=
round
> > > > > > your issue, but it doesn't actually solve the problem. I guess =
the best
> > > > > > way about it would be to convert bridges to reference counting,=
 with the
> > > > > > device taking a reference at probe time when it allocates the s=
tructure
> > > > > > (and giving it back at remove time), and the DRM device taking =
one when
> > > > > > it's attached and one when it's detached.
> > > > > Without going as far, it's probably better to align the lifecycle=
 of
> > > > > the two parts. Most other bridge drivers in the kernel have |drm_=
bridge|
> > > > > lifecycle tied to their underlying |device|, either with explicit
> > > > > drm_bridge_{add,remove}() calls in their probe/bind and remove/un=
bind
> > > > > callbacks respectively, or with devm_drm_bridge_add in the probe/=
bind
> > > > > path. The only ones with a narrower lifecycle are the DSI hosts, =
which
> > > > > add the bridge in during host attach and remove it during host de=
tach.
> > > > >=20
> > > > > I'm thinking about fixing the panel_bridge lifecycle such that it=
 is
> > > > > tied to the panel itself. Maybe that would involve making
> > > > > devm_drm_of_get_bridge() correctly return bridges even if a panel=
 was
> > > > > found, and then making the panels create and add panel bridges di=
rectly,
> > > > > possibly within drm_panel_add(). Would that make sense?
> > > > Not really.
> > >=20
> > > [...]
> > >=20
> > >=20
> > > > Or rather, it doesn't fix the root cause that is that tieing
> > > > the bridge lifetime to the device is wrong.
> > >=20
> > > This is multiple kernel driver module probe issue, not an issue
> > > about bridge's lifetime.
> > >=20
> > >=20
> > > The life time of the bridge of an 'struct panel_bridge' has
> > > been tied to the 'panel->dev' since 2017 [1].
> > >=20
> > > See commit 13dfc0540a575b47b2d640b093ac16e9e09474f6
> > > ("drm/bridge: Refactor out the panel wrapper from the lvds-encoder br=
idge.")
> > >=20
> > > [1] https://patchwork.freedesktop.org/patch/159673/
> > Yeah, and it's been wrong since 2017.
> >=20
> > > >    It needs to be tied to the DRM device somehow.
> > > Why?
> > Because the DRM device is only free'd when the last userspace
> > application has closed it's FD to it, which might much later than the
> > device being removed. So if we tie that to the device lifetime, and the
> > device goes away, we have a dangling pointer and potential
> > use-after-free issue if the application continues to access its fd.
> >=20
> > > It's the underlying hardware device backing the bridge, if the
> > > backing hardware device has been freed, How does the bound drm
> > > bridge driver could continue to work?
> > Using drm_dev_enter/drm_dev_exit.
> >=20
> > > How could the dangling pointer stored in the bridge_list still
> > > will make sense?
> > It's dangling only if the bridge has been free'd while still having a
> > pointer to it. If you have a reference counted allocation, it's not
> > dangling anymore.
>=20
> I meant that in the deferral context, the underlying panel device has
> been freed. You could keep the allocated storage in memory, but this
> is in vain.

It prevents memory safety issues.

> The real hardware has gone, the reference counted allocation could
> only stand for the panel bridge itself, without the real hardware
> backing there. It can not fully functional.

Yes, but that's not the point?

> As far as I could understand, in the deferral context, tears down
> everything is standard behavior. This is not very related to the
> lifetime.
>=20
> > > The imx-lcdif could instantiate three DRM driver, which one
> > > should be selected as the "main" DRM device to attach?
> > The one the bridge attaches to?
>
> The point is how can we select one from it.

bridge->dev ?

> > > No, It is messy since day 0. And has been made worse since 2017,
> > > from then, thedevm_drm_panel_bridge_add() [2] was initially introduce=
d.
> > > Which allow us to abuse the lifetime of bridge to a different device =
or (any
> > > device).
> > I agree it's messy. I'm sure you'd agree that we do not want to make the
> > situation any messier.
> >=20
> > > Maxime's patch just follow this way, but if the caller side
> > > wise enough to refuse to use those helper, we should be still
> > > safe. That why I suggest ChenYu to inline and with a little bit
> > > revise.
> > Hi! I'm that Maxime. And it was indeed a mistake in hindsight.
> >=20
> > Maxime
> >=20
> > > [2] https://patchwork.freedesktop.org/patch/167666/
> > >=20
> > > [3]
> > > https://lore.kernel.org/dri-devel/20210910130941.1740182-2-maxime@cer=
no.tech/
> > >=20
> > > > Your suggestion might indeed work around your issue,
> > > To be clear, the mentioned problem in this thread is caused
> > > by deferral probe. We should remove the dangling pointer
> > > stored in the bridge_list, This is just something similar to
> > > the fault cleanup or error handling, Right?
> > >=20
> > > But the fundamental=C2=A0thing is that the issue is happened in
> > > the deferral probe context.
> > The context doesn't matter here.
>=20
>=20
> Its an important factor, it really matters.
>=20
> One fundamental criteria, I think, is that *if* other
> bridge + KMS driver combinations suffer from the same problem.

All of them do. We just collectively stick our head in the sand.

> Apparently,=C2=A0other drm bridge users didn't report similar problem.
> This means that non devm_drm_of_get_bridge() callers are different
> with those devm_drm_of_get_bridge() callers.

Nope. They are strictly equivalent.

Maxime

--n47u4sjvb2gewrzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02IIgAKCRAnX84Zoj2+
dqAAAYD5bMuutsNSsaM9TphkpmFUO2nu1/Z185co6VIp5k6qkvDap7Plw5Z156ic
k9bKvzgBfiAI+OeyEuN8OMoX2XTZ8aMxQUJDvavovTA4csCBNxwZ209VomxG5wt9
22vP28hMIQ==
=zux1
-----END PGP SIGNATURE-----

--n47u4sjvb2gewrzg--
