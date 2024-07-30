Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9B94038F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E25110E0B4;
	Tue, 30 Jul 2024 01:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1F110E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:25:15 +0000 (UTC)
X-UUID: 8fab547e4e1211efaef563ec20b7f6c9-20240730
X-CID-CACHE: Type:Local,Time:202407300920+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ebe2b30f-04e0-4160-8b5f-b9754abb213c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:2f4db1f023c5b71e1a5549170f379908,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0
 ,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8fab547e4e1211efaef563ec20b7f6c9-20240730
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 980786809; Tue, 30 Jul 2024 09:25:09 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id 9E3A6B80758A;
 Tue, 30 Jul 2024 09:25:09 +0800 (CST)
X-ns-mid: postfix-66A840F5-527751131
Received: from [10.42.20.83] (unknown [10.42.20.83])
 by node2.com.cn (NSMail) with ESMTPA id 701DEB80758A;
 Tue, 30 Jul 2024 01:25:08 +0000 (UTC)
Message-ID: <e7115a83-844a-d1c6-0fe5-2d80eb6a55e2@kylinos.cn>
Date: Tue, 30 Jul 2024 09:25:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/ast: add multiple connectors support
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong1025@163.com,
 Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240711090102.352213-1-oushixiong1025@163.com>
 <edb91a7b-e28d-4145-8143-b1be2a9d7d55@suse.de>
From: oushixiong <oushixiong@kylinos.cn>
In-Reply-To: <edb91a7b-e28d-4145-8143-b1be2a9d7d55@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Yes, I have=C2=A0 tested these patches, and these patches fix the problem=
.

Best regards
Shixiong

=E5=9C=A8 2024/7/29 20:34, Thomas Zimmermann =E5=86=99=E9=81=93:
> Hi
>
> Am 11.07.24 um 11:01 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> [WHY]
>> The AST2600 tx_chip_types will be detected as AST_TX_DP, but some BMC
>> boards that use AST2600 use the VGA interface instead of the DP=20
>> interface.
>> In this case, it will use Virtual connector as the DP is disconnected.
>>
>> [HOW]
>> Allows multiple physical connectors to exist at the same time.
>
> And another question: does the patch series at
>
> =C2=A0 https://patchwork.freedesktop.org/series/136198/
>
> fix the problem?
>
> Best regards
> Thomas
>
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>> =C2=A0 drivers/gpu/drm/ast/ast_drv.h=C2=A0 |=C2=A0 6 ++++-
>> =C2=A0 drivers/gpu/drm/ast/ast_main.c |=C2=A0 8 +++----
>> =C2=A0 drivers/gpu/drm/ast/ast_mode.c | 40 ++++++++++++++++++++-------=
-------
>> =C2=A0 3 files changed, 33 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h=20
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index ba3d86973995..e326124b3fec 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -150,9 +150,13 @@ static inline struct ast_plane=20
>> *to_ast_plane(struct drm_plane *plane)
>> =C2=A0=C2=A0 * BMC
>> =C2=A0=C2=A0 */
>> =C2=A0 +#define MAX_CONNECTORS 2
>> +
>> =C2=A0 struct ast_bmc_connector {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector base;
>> -=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connector;
>> +
>> +=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connectors[MAX_CONN=
ECTORS];
>> +=C2=A0=C2=A0=C2=A0 int count;
>> =C2=A0 };
>> =C2=A0 =C2=A0 static inline struct ast_bmc_connector *
>> diff --git a/drivers/gpu/drm/ast/ast_main.c=20
>> b/drivers/gpu/drm/ast/ast_main.c
>> index 0637abb70361..428529749ae6 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -85,7 +85,7 @@ static void ast_detect_tx_chip(struct ast_device=20
>> *ast, bool need_post)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!need_post) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jreg =3D ast_ge=
t_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (jreg & 0x80=
)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types =3D AST_TX_SIL164_BIT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types |=3D AST_TX_SIL164_BIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_AST_GEN4(ast) || IS_AST_G=
EN5(ast) || IS_AST_GEN6(ast)) {
>> @@ -97,7 +97,7 @@ static void ast_detect_tx_chip(struct ast_device=20
>> *ast, bool need_post)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jreg =3D ast_ge=
t_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (jreg) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x04:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types =3D AST_TX_SIL164_BIT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types |=3D AST_TX_SIL164_BIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x08:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ast->dp501_fw_addr =3D drmm_kzalloc(dev, 32*1024,=20
>> GFP_KERNEL);
>> @@ -110,12 +110,12 @@ static void ast_detect_tx_chip(struct=20
>> ast_device *ast, bool need_post)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fallthrough;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x0c:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types =3D AST_TX_DP501_BIT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types |=3D AST_TX_DP501_BIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (IS_AST_GEN7(ast)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ast_get_ind=
ex_reg_mask(ast, AST_IO_VGACRI, 0xD1,=20
>> TX_TYPE_MASK) =3D=3D
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ASTDP_DPMCU_TX) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types =3D AST_TX_ASTDP_BIT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
t->tx_chip_types |=3D AST_TX_ASTDP_BIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ast_dp_launch(&ast->base);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c=20
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 6695af70768f..31a49d32e506 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1717,7 +1717,8 @@ static int=20
>> ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bool force)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ast_bmc_connector *bmc_connector=
 =3D=20
>> to_ast_bmc_connector(connector);
>> -=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connector =3D=20
>> bmc_connector->physical_connector;
>> +=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connector;
>> +=C2=A0=C2=A0=C2=A0 int i, count =3D bmc_connector->count;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Most user-space compositors can=
not handle more than one=20
>> connected
>> @@ -1730,10 +1731,13 @@ static int=20
>> ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 than one connector per CRTC. The BMC should always be=20
>> connected.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (physical_connector && physical_connecto=
r->status =3D=3D=20
>> connector_status_disconnected)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return connector_status_co=
nnected;
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < count; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector =3D bmc=
_connector->physical_connectors[i];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (physical_connector && =
physical_connector->status =3D=3D=20
>> connector_status_connected)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn connector_status_disconnected;
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return connector_status_disconnected;
>> +=C2=A0=C2=A0=C2=A0 return connector_status_connected;
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int ast_bmc_connector_helper_get_modes(struct=20
>> drm_connector *connector)
>> @@ -1756,10 +1760,11 @@ static const struct drm_connector_funcs=20
>> ast_bmc_connector_funcs =3D {
>> =C2=A0 =C2=A0 static int ast_bmc_connector_init(struct drm_device *dev=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ast_bmc_connector *bmc_=
connector,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connecto=
r)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector **physical_connect=
or,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int count)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector =3D &bm=
c_connector->base;
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 int i, ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_connector_init(dev, =
connector,=20
>> &ast_bmc_connector_funcs,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_VIRTUAL);
>> @@ -1768,13 +1773,16 @@ static int ast_bmc_connector_init(struct=20
>> drm_device *dev,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_connector_helper_add(connect=
or,=20
>> &ast_bmc_connector_helper_funcs);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 bmc_connector->physical_connector =3D physi=
cal_connector;
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < count; i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bmc_connector->physical_co=
nnectors[i] =3D physical_connector[i];
>> +=C2=A0=C2=A0=C2=A0 bmc_connector->count =3D count;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 =C2=A0 static int ast_bmc_output_init(struct ast_device *ast,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_co=
nnector)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector **physical_c=
onnector,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int count)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &ast->base;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc *crtc =3D &ast->crtc;
>> @@ -1790,7 +1798,7 @@ static int ast_bmc_output_init(struct=20
>> ast_device *ast,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 encoder->possible_crtcs =3D drm_crtc_ma=
sk(crtc);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D ast_bmc_connector_init(dev, bmc_con=
nector,=20
>> physical_connector);
>> +=C2=A0=C2=A0=C2=A0 ret =3D ast_bmc_connector_init(dev, bmc_connector,=
=20
>> physical_connector, count);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 @@ -1852,8 +1860,8 @@ static const struct drm_mode_config_funcs=
=20
>> ast_mode_config_funcs =3D {
>> =C2=A0 int ast_mode_config_init(struct ast_device *ast)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &ast->base;
>> -=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connector =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 struct drm_connector *physical_connector[MAX_CONNE=
CTORS] =3D {NULL};
>> +=C2=A0=C2=A0=C2=A0 int count, ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drmm_mutex_init(dev, &as=
t->modeset_lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> @@ -1897,27 +1905,27 @@ int ast_mode_config_init(struct ast_device *as=
t)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ast_vga=
_output_init(ast);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector =3D &as=
t->output.vga.connector;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector[count++=
] =3D &ast->output.vga.connector;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ast->tx_chip_types & AST_TX_SIL164_=
BIT) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ast_sil=
164_output_init(ast);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector =3D &as=
t->output.sil164.connector;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector[count++=
] =3D &ast->output.sil164.connector;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ast->tx_chip_types & AST_TX_DP501_B=
IT) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ast_dp5=
01_output_init(ast);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector =3D &as=
t->output.dp501.connector;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector[count++=
] =3D &ast->output.dp501.connector;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ast->tx_chip_types & AST_TX_ASTDP_B=
IT) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ast_ast=
dp_output_init(ast);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector =3D &as=
t->output.astdp.connector;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_connector[count++=
] =3D &ast->output.astdp.connector;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 ret =3D ast_bmc_output_init(ast, physical_connecto=
r);
>> +=C2=A0=C2=A0=C2=A0 ret =3D ast_bmc_output_init(ast, physical_connecto=
r, count);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>
