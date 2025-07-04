Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A95AF8CCA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9340310E009;
	Fri,  4 Jul 2025 08:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="drX7x0it";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-252.mail.qq.com (out203-205-221-252.mail.qq.com
 [203.205.221.252])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF010E210
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1751599229; bh=nYggTAMcLj6Uqc5ac+V9709CFd+IIQwLhlfVXY/u0K4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=drX7x0itXUb+lSzbmqKCUgpV+idoOZbkULf/rhH0ltWKxsvBqkdMOk7jWZNIxXDwz
 AWade0DUmricEdmu52u7qwvQyMrV9YM+UMZUiingvB/bdrSsQwpsIxAjL+qSHxlqfS
 roOe3TpEmNFsj6u5VXoCusb7Z+lhqci6mc4NqYdk=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.163])
 by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
 id 301A4097; Fri, 04 Jul 2025 11:12:01 +0800
X-QQ-mid: xmsmtpt1751598721t1fxbom3j
Message-ID: <tencent_CC020A5F9A042ED46D9E3F5792E3FB53F306@qq.com>
X-QQ-XMAILINFO: NCmjBvJFq6XNTfcRopDfMWg5EYfIHLYheuFWAK/UmgouXBcs/zJRiRSLWo0K2L
 RRA6nZSGdhBnzAudMiRIDPRvcfKXgsSz4RP4knAs9mq7HQTgOg2PoudFyJCiU9LcX6Y2e5p/WCOI
 7U4QhqFi4eFQzbmcAqYWbOXeYWxGeMpO2hxDdaNrbyIFK5j2LR1BxMPHbuI4iN+qAVuekcqLXHWm
 9GWdXlp4bYcEvw7wgzX3YKm8GE+HROtUgaFSGPT+XhnfLRo3irQ4FeKS+0ZmJE9hFvU+7QZ4pqRS
 4Nareug/R2Itmo1sAXIw5HwRog5cwhDsWT4/zNcDY0YnULcuFps09ySbs446b9/gnpnfKHWlIpC5
 rJIQ2Z2rab8t80AT5Yr4hQukaHpWTAtB55WFvrN5kBX06M1QWCPRFnel4wnZt2nidHNiiNic2YTy
 FTG/jJjZbGLKc0LI9XwE/P2toGe30Jzwu4Ahf3Rf1ZuhOZpE0YtBtVqDwEf36eqCatznc1ICUW34
 u0j0aw4McAsoZQ+Vsr7NmS1VYjKkIS9IpcO4abAaMi6V4cwMIGx97/ZWcjImS/ERbv7v0nyP6CrI
 +68nP9E21HoHRMnbQ7IjPGlb0jkiqYoZUp4SMh5egYhcrSH5ugFJj6e/utFDCWRsDscfrT+vb0CG
 o3XT5+likPfAKEPj0T5tbU5abzvyDyCIZdxbLUaSD//CQtgTgkfpxOEoLP2nSf6ll/NXjW265jms
 ml4KYdNJOtWlSVUk2QyuZIYhA9oEIAHnBqM53lEhv7wR/5531Kop7NuRiGyjGEYwj9oye67S5dGO
 RaVLvM7x0lDXwyO6kWnqrWb5ngOMk2gBoSMn+AEC746ulNvAQ+6B1H+D6HfqRpnYYrQ6oQyw/esE
 WQV51ZXFz5UE3SV9YHTAwUyAW4js5DJsY8La00byLqfFDnlMa1l3mrxpvg7OXfcCgeSDiLKhDJCU
 bRXWR5taDF8OFGLzmY/WW0hfm7mwmlzBEboKeO7ydIuMvJAaOVjzP2XIT1TtrBTfkQLtTBlbtDe4
 zk5B3whbo6RcDzQr2YebBytUkldli3sZUQsLXj7jN4790CYOXtNXYlqQsjQIaX5nsYLJoOSQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: jackysliu <1972843537@qq.com>
To: harry.wentland@amd.com
Cc: 1972843537@qq.com, Austin.Zheng@amd.com, Dillon.Varone@amd.com,
 Security@tencent.com, Sung.Lee@amd.com, Wayne.Lin@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, alvin.lee2@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 joshua.aberback@amd.com, linux-kernel@vger.kernel.org, linux@treblig.org,
 mario.limonciello@amd.com, ryanseto@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Subject: RE:[PATCH] drm/amd/display:fix a Null pointer dereference
 vulnerability
Date: Fri,  4 Jul 2025 11:11:56 +0800
X-OQ-MSGID: <20250704031156.3113667-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
References: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Jul 2025 08:53:39 +0000
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

On 2025-07-03 11:15, Harry Wentland wrote
>Thanks for your patch.
>
>Please run and fix this checkpatch.pl warning:
>
>WARNING: From:/Signed-off-by: email address mismatch: 'From: jackysliu <1972843537@qq.com>' != 'Signed-off-by: jackysliu <Security@tencent.com>'

>I would prefer to simply wrap the dc->ctx->logger and dc->ctx bits
>with if (!dc->ctx) and avoid the goto.
Thank you Harry, for the patient review. I'll submit a revised patch later.

