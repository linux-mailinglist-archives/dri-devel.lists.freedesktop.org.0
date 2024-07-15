Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3593136F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 13:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8F310E34A;
	Mon, 15 Jul 2024 11:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="O3wLl1VU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A4510E34A;
 Mon, 15 Jul 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721044105; x=1721648905; i=markus.elfring@web.de;
 bh=YrYnfXpy81C1jpVdx1iEDBRM93/KVFVJhrGxbIs42Zo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=O3wLl1VUF7LITZD1j70BEvsYV49fx/ujqG+DDVpDYes8HrJvUXO9AzWakaFw613B
 DrJhLF9c2kcXfa1ML4WjXHXssOHuT4sJCtlIY4CzM0VadjwOMixpHgh45GneNF3z7
 zFldOJ6+TYHjK+LGlz0BGrta8ltOalQxQN6VLSHPdcmOXWc6Dx0Jg1qAkN3grgyiG
 aiipCJwA83GUcOTKccu5sQixE5uokFz3LM+WFyjgi+G7t1bJ/MbtUoN0TkHymnjbV
 WCsUGzOaGUhrmEVo8Y4y4BROeQH6nApMkU+xJpzSFjytyku91HvoVhlL6cXfStC8l
 qLy6c3vndXnifZasMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTLO-1s7Y7N2tOq-00r5Y2; Mon, 15
 Jul 2024 13:48:25 +0200
Message-ID: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
Date: Mon, 15 Jul 2024 13:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:71gomZOBeHsXTuuGCpKsfKlHuOH458fHULk6qYyu8eYyRHEy6wg
 vxu79FguCXSArnOkasdaTOv+hNaMNrALYc4QlU5uT+/sl7qPLC4gHFGZkGt7LB9/4vc1+EQ
 OGojZV0bf1SSPdsA+bzDjf0TCKn7tY9FpoBuDypjHKZpzOwR6qWxHEdWZrisg06jk0Ywm4F
 kGsFCja0s75FSjAvjjJxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zd36QuBqUeY=;DvV/O/HVJgTm6NgAelVqBD1ToEh
 1P17qaHVy+oOo1j7GgyIj/vWn/mFdkifai8yneCRsSE7DKGPT+G6FGyTkM5A3zZODdBOlu93Y
 FD3shkGp90AxoqYvRwH8loeMX1mA2OPusxqv6AntsgvqWnVty4nOsH38gNBa1Tx8ZBhsbtgCb
 LjdCI0qh12c2dLW5WGa8nuJfoFg4i2IR9MM62/byjibMNHv6IzTHgLdMiR91QVMib+Dg6NduG
 ezH4qGwWbRVKbCG+MrBd7pbvx4GqRY6IYrw/79BIE1cg24OTaexRN7hXd/9EpwZo4tUKebFAp
 ut1Pk/pOu7MntiCR1we6TzBVdvILKB8TKWN6osU2Adz4oqmJpPZBB1TswKW83gHT32rr53Mgd
 Z9OtpuYem3VqacI/Z5S8u3V5SS3ti8SmGPtw4AiHwYtwrkvlNTVd6IHiWchik2Y+RLK7WL3zf
 15dxIN5PlILxJk4w813upUQncxFtJO7xKD9q5y5foYtN7TFi4t+rfmwtOnkaOLQ09Xot3wBYp
 m9T3ZDiO5d2T6lKaBf8ulYIdCIFT+SuuWSkypcXdkV4eKo16hNtyU1wsBZhuYQ/iFN8A7IGDo
 UZihD49sVxp7XR30Dgjy5/CO5lQX+wfMLTBbAcb3k3DudlUQK1U9HMrZixKP6EwtZzO8r+BmB
 z5KrTTTZGbw+b/EfKCjJdnSvdku05VnBOTx0abVwQ5DoM0HfJ2+vIafTuEcihysaUjR5zgNcI
 9UvFNUKkSD5jl7gTKQE+DNh8wOrQEn8RnlFyHEqfEHED8MgetzIh01SE0ifbaG1idnOAruYO4
 239kA1LUUEoiOl/ZFJVNHFCw==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jul 2024 13:36:54 +0200

Single characters should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D for one sel=
ected call.

This issue was transformed by using the Coccinelle software.

Suggested-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index e83db051e851..931b62097366 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -42,7 +42,7 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *da=
ta)
 	int i;

 	for (i =3D 0; i < drm->vbios.length; i++)
-		seq_printf(m, "%c", drm->vbios.data[i]);
+		seq_putc(m, drm->vbios.data[i]);
 	return 0;
 }

=2D-
2.45.2

