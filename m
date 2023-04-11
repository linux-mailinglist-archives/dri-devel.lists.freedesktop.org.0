Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D06DDC8D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557BE10E36D;
	Tue, 11 Apr 2023 13:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622E010E36D;
 Tue, 11 Apr 2023 13:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681220763; i=markus.elfring@web.de;
 bh=UmXfEwjkGD/rVmjQKSe4E0UbAXydT0j9qkxZgnZJ+3w=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=aeAjcezU9SpnI86W3rEWETjVghG+BUjtoGlGqRk+XUJjj32Vw+vNkw1fIN+m08MKs
 a/nxNwFPXPhPHuN9WBcaFOtMnKTX1MK8JQchLG2Bg9qiM8H6KFC1vtwflq5oW97K3M
 wl18fx95/GSiF13PiMaFouZc58Kd+b0WGVguoygDPyKVowAXN3SiY0CTml1mAi3AhP
 WtVIeXNceToEBFy3SNXT5gLLwbHWmLeGQ6PG9k/duQk6KRv41SrWv0WL0idfPCZDHV
 +mzfEIsUsK8/v5Iuy5QejsE2F9ad2yNgGoU7eg68F0v6f5DOlc2pu77SpktzDYmm0c
 OPhO5wIQX1BhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1qZGSv1rbG-00w6KT; Tue, 11
 Apr 2023 15:46:03 +0200
Message-ID: <dd420968-47f1-1839-02e8-d06ffef6c0c3@web.de>
Date: Tue, 11 Apr 2023 15:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 3/5] drm/amd/display: Delete three unnecessary variable
 initialisations in trigger_hotplug()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
In-Reply-To: <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mfR682QWIB15jomI2vo/3Z1VdYVfDYwQO9OXdo8EDMvcQgHyx/z
 eApczEwxVZzgBSCmh8Kd+M3yBz0dM3Cy4eyNfHIt+qTBdmkMBXeQ/l3SnK8lqi6qi9M5tQU
 IYcdOGnmHCPbUwv1U3z7dUYG6dmGviiViwLoln1Y+kjVFkUC0mNG/Nd966zNnZLDvXzVAdA
 y5+Rvy7tcuUBSHX9uGJKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vqGhnX+j9qg=;kwMl01xOIqacGYDb9vukb2sItW/
 BwIc6yyMLzSg3cNKYYBo1FzmmVyo6rq8Hx4X2CFaHIkTR56hoe3Stf57DsoRPQEjZ2UoWzsyg
 +RPcZrRJiwbzsUrBu91HYD2FsGqueE8XCBfO8a4MG7DFy4p3rP2Q5ROsPdUb4WFJsyxRYHxm1
 UdL+YxwSjlqFP6IChVsjC5+NIQyvfG7yvkHr21Z+9zlRe/bttCtqqfW9QgMPcZJVsp9GLtzZN
 dwIMQ2MhhaYQk3E3VNFS86AAIirSRTpokn+26d8JALNhZjWi3G3OFNsSMZMrckycbgYDa31ue
 pjJfcPIvHk+xs0MS2IDcaKdDax0tWA5ukUuphTd8N8uyhF4zW14/Tb5Y87CDt2too1XfeX6p4
 pe/t4J9/hAESsmvwKAUKnz8ihmejoowIFnFABy+hng6Pwvf4/bh+TgV69zhQwDOesA/oRjEs3
 6mXnu7CS2xkILAfgMxh48FajfgumjTszZoDlHoxlz0vAc/OD5YrMhFUy8lMp4mhfz6Q73Qzje
 Hf701mWB7Ef0f+vM6j3vMnB4CX16gHWbpIA9Jgw28tKhk58dLSRfq3AlyR8+jyqbFQxWtT77f
 CZlabKfhQWPxG23OVqz3q3iCtJEk5G/ixyj0wu5D5S3NDSRiuF7gbLwQRgPOdyZ2A4Py6IzHE
 96LVah1CZBcXnEe5Ej7MHLk1SwIl+AAEku8EoY0atRwcLC0q2e9ebSz2EFGo/lm7HFDCgBiOk
 /qVPBmQ+tuhNtnD03ByH8EWBiZcuDXYwXFhkvTwApoqJDRwpikexbaDsuH4N4uPAZY0VeEWcM
 2LDqMMUOKTMDdVKQc1MIA9HveKcwHVFWvvmYXNdc4ZlEmB8NTZoW99KRhCyIk/AaDVJRk/PKY
 SjMJuxwsYsnVrmDNoreDa7y9jn2gxs8cZJo2Q5WEpOK+MJs/4S1aRAEab
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Tue, 11 Apr 2023 12:34:42 +0200

The variables =E2=80=9Clink=E2=80=9D, =E2=80=9Cwr_buf=E2=80=9D and =E2=80=
=9Cret=E2=80=9D will eventually be set
to appropriate values a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index b3cfd7dfbb28..a37d23a13d7b 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1206,16 +1206,16 @@ static ssize_t trigger_hotplug(struct file *f, con=
st char __user *buf,
 {
 	struct amdgpu_dm_connector *aconnector =3D file_inode(f)->i_private;
 	struct drm_connector *connector;
-	struct dc_link *link =3D NULL;
+	struct dc_link *link;
 	struct drm_device *dev;
 	struct amdgpu_device *adev;
 	enum dc_connection_type new_connection_type =3D dc_connection_none;
-	char *wr_buf =3D NULL;
+	char *wr_buf;
 	uint32_t wr_buf_size =3D 42;
 	int max_param_num =3D 1;
 	long param[1] =3D {0};
 	uint8_t param_nums =3D 0;
-	bool ret =3D false;
+	bool ret;

 	if (!aconnector || !aconnector->dc_link)
 		return -EINVAL;
=2D-
2.40.0

