Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0D6DDCAB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A343610E536;
	Tue, 11 Apr 2023 13:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C66610E536;
 Tue, 11 Apr 2023 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681220909; i=markus.elfring@web.de;
 bh=PmartcUcUfUvHCefd8IJ+WPgBwHOSel2Zds0LKRahh4=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=nrVQQa9ygHmJ/UTngS9Q+NhPtrZjxolEMDWtgwbBekoz+YGIiacMtU7RJ/LHhZTUD
 rcDD6Hzb+hOzDiWZCDBMtv/KWa73OeK//KPLPeGLhReyNrUNiEg0zR98N9BGai7OVf
 t3wXerofMNlLalhYNDijRHj+UWf8rTpw8zvsoQI38RuHMUIkkcs0LFvbqmrtbweuz9
 ALsCyQbRvaqbdChOM6aCQ1l2DxCh9TkDu12TH7wHeqpVP73xJt96Zuj9oIh2BQxfox
 KcXvsIerSHZPILuF6ghFjZnhS20XMxFu1OayLE/hAMpP3iahCKRPKbAP6lHtaVYHwI
 B2xa4j1XvPAKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWi5s-1pskkP0uhk-00X2oX; Tue, 11
 Apr 2023 15:48:29 +0200
Message-ID: <c06c97f8-7b5e-ccb7-e634-aab8ed450e7c@web.de>
Date: Tue, 11 Apr 2023 15:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 4/5] drm/amd/display: Delete a redundant statement in
 trigger_hotplug()
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
X-Provags-ID: V03:K1:OjNaTpA6rVU38fiTJC0fNNG2t5tB53sqqQBlbcCU5z3ROHPDvcj
 T2gqQXeh8yKLTB4ZZgIdo37z2QE9Bu5ylSF4QIGa0tHspLI264JEP5rudggzyB+U+TjbEfW
 zi/siiBDU2A1X16WR39Av+5hKyI6irY6syLjtUH2HOIP+UU3FzGZ4tgGJTi9x3yo65L0s3S
 yunPLxXOdRyQzStwxTyIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7EabMdF49OI=;x9HznEdNHgVb/jUMFKku/XplEHV
 xT0XNK29XjKB1UDQ3hGxZ+JoLOhxjVL3VZK2wpb23SJaynAIAyB4utT7Du+0Durlf0cQM3a98
 bhLNqFrRg16PUADKH6PsG0H4gsDl2dDJeEdB5uGjfO35c55Yuwg0mdJ38g8pL+inZL0MkIQFl
 vh3HReLxJ/T5THBM4g1hMQ3OygjIZoZpZyVl9m1PkRyqw8KAED8HeXOTkOInAySM4A4f+Ej4b
 xTBwQLETNnsjMrwJNY0uTZF27D+cx2tCDRUWUaCc47+GuRcdC9noRXQk0EuM9jjuGvtqcB2ZO
 pRgV7plHQsGa0uvA3yYB9n/9RDFRm3dCTVgsJx99C6+3Qwvlz35gUKaJGfEz2+MxCvq0JnAYO
 cRGyP6qW/SXr7aRkQf3ullLO3rmQfboqy3bLbsoS4NLPPkY+pPUnLXJSpASa2fCgQgD/8ieHh
 rSnHM4rIeKwXSmGUI03sLTUgB05VQZ+m27SSR4UnDaIRMHcDa37iBwFfW7nn3uDLkRk7dHkqF
 IPbRodhPIaJN+9ScxT5Ebua2SXIv5vHnSYXp5XlVIHC8jdGq8I2zOB7H7j6QB1N0uAvp/CbFH
 js7q1LOoOv4O/VlT1pkh2bY/AVUTsEC4LMus/fadO2ZangeoXpiUGwJWjiMrGfHaUFdzcL0bH
 AjJfhwZ/fXWhWDH7fxxUgKiyiYZbSSX54NW+PJxf14Jwxl/SWlvwhXiBCgML1ajirOWON5SjK
 +gM32NaEXy+6Q2eTraOO2js2kTrq19pAPhae3ulbe2v5llno09GLPg9FmVEoznUfplXb4mIPC
 xWq2UOIj3/2G5+my4hZeBfCLCQzxnlLXt/HQaql9E/1sTRTmEXwmF6tiBcHhUOFHtrIfye+1H
 CC4E3E5IlJn8FL9NG+WpYfOYzVYkw9cmBFcxqczKMIh4KwBpK5VTLsDdJ
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

Date: Tue, 11 Apr 2023 13:26:35 +0200

An immediate return is performed by this function after a null pointer
was detected for the member =E2=80=9Cdc_link=E2=80=9D in the data
structure =E2=80=9Camdgpu_dm_connector=E2=80=9D.
This check was repeated within one if branch.

Thus omit such a redundant statement.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index a37d23a13d7b..4805a482dc49 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1278,9 +1278,6 @@ static ssize_t trigger_hotplug(struct file *f, const=
 char __user *buf,

 		drm_kms_helper_connector_hotplug_event(connector);
 	} else if (param[0] =3D=3D 0) {
-		if (!aconnector->dc_link)
-			goto unlock;
-
 		link =3D aconnector->dc_link;

 		if (link->local_sink) {
=2D-
2.40.0



Am 11.04.23 um 15:36 schrieb Markus Elfring:
> Date: Tue, 11 Apr 2023 14:36:36 +0200
>
> Some update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (5)
>   amdgpu: Move a variable assignment behind a null pointer check in amdg=
pu_ras_interrupt_dispatch()
>   display: Move three variable assignments behind condition checks in tr=
igger_hotplug()
>   display: Delete three unnecessary variable initialisations in trigger_=
hotplug()
>   display: Delete a redundant statement in trigger_hotplug()
>   display: Move an expression into a return statement in dcn201_link_enc=
oder_create()
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  3 ++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 19 ++++++++++---------
>  .../amd/display/dc/dcn201/dcn201_resource.c   |  4 +---
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
