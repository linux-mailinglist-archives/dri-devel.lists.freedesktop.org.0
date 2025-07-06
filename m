Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01267AFA806
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 23:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C68810E3CF;
	Sun,  6 Jul 2025 21:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmx.us header.i=len.bao@gmx.us header.b="j6Wl7XQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2729B10E2C3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
 s=s31663417; t=1751819128; x=1752423928; i=len.bao@gmx.us;
 bh=3jIyMsJnSy+l51ldMn9A3Ee71iCGmD9e6ZKCMwz6msM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j6Wl7XQfXGhef8xeGPelzIsrOjO2g4YHH74HLFwpqD5H8e+8vflMZdF5/ACv+VKr
 t0iVfCWGKdSi3rjf0k0+MxHVQU2OTLVE1pzn3RK+09+F4MbfpNwy/RPS9AlgBJ1ns
 rJM82F3y1ZgLNsKdBIP0Vvp6/borSL374x0dC3T6GUW337aUcfTLj/arcC7vqs+mC
 uEBAZ1x6aTgSj5agaIE1d6mjkSw2YQSUSMi7ckm2MawKJr1JAAJurPZoc80YlgZyJ
 MNar0gJzMxqVjhrdx1AIdSQBitkv0YuCn10/2EaycxHSIxqhlyQu1OBEc1GZXugYe
 A+taJwGowleT5HUVrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ubuntu ([79.159.188.137]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M89Gj-1ucamB2JSF-006zHY; Sun, 06
 Jul 2025 18:25:28 +0200
From: Len Bao <len.bao@gmx.us>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Len Bao <len.bao@gmx.us>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/dp: Remove dead code after return statement
Date: Sun,  6 Jul 2025 16:24:24 +0000
Message-ID: <20250706162431.15029-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RHlu5KZ7dEWVmI+L0jb/2dxeZ51aOYx3Brk+XhbyCMuwuwsua2h
 DgkxHsngZTUS52ALRcoOZFnT4ytpYCwQENJe792NnO4iOvV+LyGl4luw1xqPjO1gTPWlCS2
 vpx5nN0hHhIhxtmdljC13yj1kZ3yi/JX48gc5qBfxVEKIN4lWydB9XauZHkTjggB56k4oqt
 rW0DJjtkx1+pn8jstWsbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OqNaUK7HVCA=;r5jFjER/zgYasbYrUZE74jzmP4v
 y6WAT7z0X/QNOyw0x8jhbfmfSuq4GIKOVVCMYkRtylpmwZK5L4gI/iFbPVj5XjkPGz0EjbgW3
 F+AHzW+RwyLzoQNCBzXBTtbQPGuSDWqGYlS1i+BAr2L9FE1WW0QFmCCERiwtrny6x7KP6vADv
 UjEQHTMtiHrD/+XbzZnh26Gp+mUZ9uBRfTNYfP+F/4eU9m7WoWVblriH/hJqfVKX5zoIWbfN8
 ipxmW+AGShU+jK8zkkh2d3kII+U9tIZ4pfFeDqA9xM4Yk4UK96pep8qWV7bW90DcEg6G6W9Qn
 urb2wbALMbohd6oFrMbSmihmjUdQ7gWCCEF77Ayn1fDGqVGDbhQ4Pf2sZHt9oQ6syvwO/zcdB
 n7nFIXS/YIhNEIlQ/iml/o/6V/BITr8hXNWBEMr7faOWzaJDK/U4krOMY4MPB0zxmkU+xeh1H
 9pNHpnqWqIDm6rqDOOVlyL/8BpZmrJyCy0i9DINgOXIjWUBrW354ydp8y9Wi1YpiaHWRzijje
 AiUhPMvYY/+HgB20MKXwnHiyOGsCM8b6+VJD9unzCozek8ZQMtVwpt7xEFXWJahXLxvuEbpjV
 rRYa2fcJbUC59GR/6v6oXDTx5ZGbxk03JiBY3ZHzx3a5BUzhXN7TCL41mSBQ+xfSWcB6nVAid
 XSqWQ4aN5pVhmrWVzw4kBJX7MPQh3nhZqehy3vCARWVJaTd9e/xDlk60V3UdrTn+6spoHnzX1
 Niw73LWPVAR3hmGnjUdTwRoE8T16hUfDaM/XPA9AVQ4zonJ0mFwB0tTQSxbJOZYCvLyvMhoUL
 o2elykPsBie7BwbkkYsuw4dJodLRgQm5yXSuI9GHS8UVAuFFpUQ9Zj6+XoTf2aPxQa4NtuAvI
 ZWukHk3jaJeE8lPN9VrjtdjsYDvB8JlSIygymMekMNFdp19t/QpzDABa4Nar8WTwIvW7nrUlM
 8G6U9WCrwrDVcJXHcpNw6IlJ6I7Zl33zIGPBBXvsxyzF5a9a7gJC+Wr4OaKem3WdUe5q9DXBO
 bilYbQHCcMr6axZmZYI0+DAM7bn2Izimc6gk6npcdoOlUccahDInmutLzHa6BRjQNE3j7pQ/2
 6UYQ/HmqAVoFnif6EyW8KAaWRvvkLECaOYzOJnO2ZH3UAZQixFpK0S+12ujQHTZ2s8b/FRFV2
 bNXFSOfHQWT8OJi7dQAmRCe8/Llj3a18km+SCMpesfx1f8cQTa+rySzGxstD7AT84VmvyWbU4
 jLEpupcChHUMv+mv2gjWHMuEAZPKM+uJE9CWlXhvn5+lgKK/DGzu1cJ6ZOr2Q/y2Vucuya+FF
 qZpfEYM5oYpDwyTtHPVJtEFDBKWoUPdJkmkdeN/hF30ZoCtPdv4e9OfFg25KAVUcRU59UsEWC
 bbKPDF+pXTQDdVDK57GGsPzj/knqpwYW24O3MsKb4sNvCSZXEsZ6Bsz4+3sXOrB7tRDKc0nR1
 XZnMqsYpby1N6x7e6WHFaG6APLax+JjyfRN1Kup5MNk/OSOAb6LK40qtXd+9hrg2slyQwyWX5
 ZnPD4Cv9EHLPqLaf023ggLT2RHeE4odYpi/4aWO18qXFxtCScv+6vzNsd0d5lUYL8Z/gj56bA
 c0NKyVeD9OhTlO7yY96C/XrGmOzf7F2YrVnd8t3vqOsXXlfUhkLN3P//lyJ+KommpyFYonaN5
 pQH4wbTD7GdMsA58cysPnudIj1mFoldo5W5A7AKs/DFtGmF/o9YAFIcIgP3srnyZitbFXf2QT
 rSO3NNunFvqKbPbG/hR2VkIX1bNkQBV7167nvhi/iAPCWbXM7/5KUD3LUmZ7o8NyApZ95IAQ3
 vyG14UE/MbaPw09nFXAnvagfaNkEX7a00n6jXITUIfSFN4ONzTTUnaJ2yELn5vwjkdEYm5+Tu
 2IdHDWlqqvvo3ZpYIYMb/lgfPLLIBrPJl23EzUhFX+XtcGg9w0/7guvYzOQMHs7BSKx/mKZEh
 2BbejYFqh4/DkjAY/PhHvZR37uXPp/MuhIZ4uSUdT7Xq044MsLNmR6lxSBFuOIaUTjrHt6bss
 jLPAI2zPt/mVreUYL+roUXLX6BZR8Pa4eIn/x0WPMSEA5AmG9zbG5i55Vg7IyvWvHylzfShCz
 c5qJPo5FMDnFKLD7MxEoq4hKJ41Qj98MFhvjdAv0V5IOtmcnM8GMOqpVCFq2XZPwG1VLkNn37
 JkANfGh7TKiTXMXV0YEVY9vPd24BkA7tl372XAis3BlALQXeRI8XbNbNcyGnIiXu9wg0IYjUn
 JqIP2PHNOFu3Pzh0qyFsmoaHhQRh6zU+vfZHWVhJOw4TWZeIEemlya3F3yZlunbNtYrkLO/+B
 qL26J0PJ6O9s0o3O37v/dSfueNazpRoU2jndyC1/8Xf3wv0kfwQTIE//w9kIftYxhl72Jb2f8
 8+sSWbrao/pyxqcZiZr4IhzLcrEXLQduR1FhHAduKoAEEG6R3Fw3zGcsaINTgbqpaGyp5Fgkx
 ixJhxa3yp/pUWoJdjerlSjkvsfKCYx1m0SERt5wm4BzeRqaBgIfhLKxx6k2vA5chrk9L0odO3
 XuewlNnJKS34zf42nq0DWwdJSpAQ771QZ0Mxlp23W0byJ7Ho2okhPoExGdSlsb+3/5tBof1ZS
 vG/JuvMwWAX3OjeKhcCZz9UTexGBnrXrFvt8SzEnBTwv79VH06dezKNUODTRGBvsTH8m/kD0L
 jeKtEjtMZKuHrM+UttGartgFKupi+n1eRQnd12eGTaXLeKEHV8P0lPfaD3OSv2I60dv82EFS4
 OB0upga4TSO3+DR1e7jRL/bpTm1AD3eMzp5qRwA7G4G3NShKl7jBwkAqjvFc0wa2swLJQU+Gi
 FidWB89zvwtPNpQlyzSMTDxpfRWOryxktL1tdOq3ePMq06T6N2LTNMdr8Hbjx94YdeWdIT9lC
 GuB44ysDzq0iSkf8+40G9Dfr27dOsdUl+n8fA9o7tHD72Arczjfer78MJqLa/rP7Q1j+NtMsg
 UPAUc6kUWmca9KbNH0gPW6jnkgagJj2kLjLJbbVEqWWtCSWaP8ooDsTBmvjhXm6oA2zSkQD5x
 NKzfjAFE003MPXr7YwFd2wWdVqHV0WhHhtNgPID+trR0A1uVu9gc0lB3sCJE8WJG379lgQ0p/
 HNsW3JxpUGdhOXBh62Uct2v7k8t/qhhNliKsAQ9F1SMBmM6Pv3Gzuys1eM1eWYI/w2LkrSRO5
 0O1cwvMqGdWiItGtoZ3JTQcNT5qGvvngif0+c+g7Badh9VdY07P/i+Bxazjp39nkyJL3945WB
 NkCJ3DbkqaYzQKgLRD0C29ZwHCU+0PUitCMddiHYsM0qNzOO8AMicgvMbEmqaBmC4gg7fHHGT
 fFHCidwN9foHPvVBzW1ycL0XBW2tw==
X-Mailman-Approved-At: Sun, 06 Jul 2025 21:58:36 +0000
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

Coverity noticed that the code after the return statement in the
"drm_dp_pcon_frl_configure_2" function is never reached. So, it can be
safely removed.

Coverity-id: 1648885
Fixes: af67978ee37e5 ("drm/display: dp: use new DCPD access helpers")
Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/dis=
play/drm_dp_helper.c
index dc622c78d..de047e30d 100644
=2D-- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3586,10 +3586,6 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *=
aux, int max_frl_mask,
 		buf &=3D ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
=20
 	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
=20
=2D-=20
2.43.0

