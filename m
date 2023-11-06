Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE87E24EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F285210E316;
	Mon,  6 Nov 2023 13:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E7210E316
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:26:31 +0000 (UTC)
X-UUID: 68c1e78aac2d4c9eae9324cf631b5914-20231106
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3237dc1b-63d0-413f-8adf-db743d8e797b, IP:10,
 URL:0,TC:0,Content:10,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:15
X-CID-INFO: VERSION:1.1.32, REQID:3237dc1b-63d0-413f-8adf-db743d8e797b, IP:10,
 UR
 L:0,TC:0,Content:10,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:15
X-CID-META: VersionHash:5f78ec9, CLOUDID:179d35fc-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:231106212621OQUAH2A4,BulkQuantity:0,Recheck:0,SF:66|23|17|19|43|64|1
 02,TC:nil,Content:4,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 68c1e78aac2d4c9eae9324cf631b5914-20231106
X-User: oushixiong@kylinos.cn
Received: from laptopjrnhc6sg [(222.247.111.235)] by mailgw
 (envelope-from <oushixiong@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 288226259; Mon, 06 Nov 2023 21:26:20 +0800
From: <oushixiong@kylinos.cn>
To: "'Maxime Ripard'" <mripard@kernel.org>
References: <20231106073742.158905-1-oushixiong@kylinos.cn>
 <6yqalig6nvnlpt7loetugjdgp5z4w3qwhpqpzzsygffp5w32d6@guq6v3g2z7tq>
In-Reply-To: <6yqalig6nvnlpt7loetugjdgp5z4w3qwhpqpzzsygffp5w32d6@guq6v3g2z7tq>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBkcm0vYXRvbWljLWhlbHBlcjogQ2FsbCBzdA==?=
 =?gb2312?B?YWxsX2NoZWNrcygpIGJlZm9yZSBhbGxvY2F0ZSBkcm1fY3J0Y19jb21taXQ=?=
Date: Mon, 6 Nov 2023 21:26:15 +0800
Message-ID: <000301da10b4$d4e90690$7ebb13b0$@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFcR3YQO3CUUdc1Zt+jjVoM53ycrQINT5JbsVhur6A=
Content-Language: zh-cn
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
Cc: 'Thomas Zimmermann' <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, =20
I think it will cause memory leaks if too many nonblock commit works =
return
-EBUSY.
You can try to send large number of nonblock commits by
drmModeAtomicCommit().

-----=D3=CA=BC=FE=D4=AD=BC=FE-----
=B7=A2=BC=FE=C8=CB: Maxime Ripard <mripard@kernel.org>=20
=B7=A2=CB=CD=CA=B1=BC=E4: 2023=C4=EA11=D4=C26=C8=D5 18:33
=CA=D5=BC=FE=C8=CB: oushixiong <oushixiong@kylinos.cn>
=B3=AD=CB=CD: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; =
Thomas
Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; =
Daniel
Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org;
linux-kernel@vger.kernel.org
=D6=F7=CC=E2: Re: [PATCH] drm/atomic-helper: Call stall_checks() before =
allocate
drm_crtc_commit

Hi,

On Mon, Nov 06, 2023 at 03:37:42PM +0800, oushixiong wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Calling stall_checks() before allocating drm_crtc_commit not after =
that.
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Generally speaking, we need much more context than that.

What bug did you encounter that makes you say that it should be moved?
How can we reproduce it? How long has that issue been in the code? What
makes you say that this is the right solution?

Maxime

