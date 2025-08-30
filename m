Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83DB3CE60
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 19:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4E210E118;
	Sat, 30 Aug 2025 17:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="T84joA7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208310E118;
 Sat, 30 Aug 2025 17:48:32 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A5B1440E00DA; 
 Sat, 30 Aug 2025 17:48:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XkJzyz9Yx29P; Sat, 30 Aug 2025 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1756576103; bh=PoXjEkaAcc/flHSmlJ9GQv3iSJMxXG6LBAdj5AN0JbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T84joA7WNMFR5PYNZSuHtbylHyIoQm8jfrqh9x4pXJ2Tl/CVi942cBlkmZYKJNTiY
 3Ciq9dm2ZvtTp5DGp06iWAv3OB9TY/HfHEP7kjsFi8qfGDbp0B1Q0Rp8XTHS2g+Vgf
 T4rb8HWzp3lTMBhRDVnx/QREQOAGIh0YOAzoAO4S3++6ylUVsjFZPGip7uA0oUhAXr
 2ETDLHnOiTmXEz/uz3BW4BtLS4Dyulo9ZzNxfCD02U1iCUQs3jrzxeXA2MW2NEGU5j
 u1KLZXTIeVWTe6TvQxgytVkdfoBQcJqs/kO+iwLuc+14jOt7xbo1/Y8aDUhkVrj/B2
 8MwambP5pWXa8RkZ9kiw71iHs24Zo3tQwbstJxeVRN3lbscCMAuH6fE0UdCR83KJXh
 VpzdsmToicnq4tWIQjxQI7+Fk6322mVK7PVM6BSdXwvhznkNMywzo9VjYO6F69G8PO
 W9Bw2QV6rqhZFox1VxfAdhKcNDow6oEgin+q7z46rg2o0e3yu8BwiPaUJTnTEG7oRQ
 CZACzojAFjfArrqp2jl/DRtyHOIB4ROwx6SN6cOnEnil5qzAnoibWBLHPHUe+Gx2L3
 74EQ9Bb2xKxLTUGlgTPu4BaHH4f5Y0z2mF+wEC6hZKsYn28YeWq8uh0Ms1jFQXQMch
 gqpeEAG9cy+qn3yPfT1ACkyk=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 6529240E0140; Sat, 30 Aug 2025 17:48:17 +0000 (UTC)
Date: Sat, 30 Aug 2025 19:48:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
Message-ID: <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
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

On Sat, Aug 30, 2025 at 12:30:09PM -0400, Alex Deucher wrote:
> Yes, I agree these should be warn_once().  If you send a patch I'll
> apply it, otherwise, I'll take a look next week. 

See below. I tried to explain the whole situation as good as I could.

> For some background, older GPUs did not support memory protection, so the
> kernel driver validates all of the command submissions (CS) from userspace
> to make sure the commands would not access any memory they shouldn't.  In
> your case it's a vertex buffer object (VBO) which contains vertex data for
> the 3D engine on the GPU.  So newer mesa code is sending a command
> submission with an invalid vbo size.  As such the kernel driver rejects the
> command submission.  This may result in subtle rendering issues as the
> invalid command submission does not get sent to the hardware. 

Very nice, thanks! I've added it to the commit message.

> I would suggest filing a mesa bug report:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/

Right, I'd love to except that's my main workstation and I don't love
testing/debugging kernels on it. The thing must JustWork(tm).

I'll try to repro on some of my other boxes and report it then.

Thanks Alex!

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Sat, 30 Aug 2025 19:24:28 +0200
Subject: [PATCH] drm/radeon/evergreen_cs: Make the VBO size mismatch message a once-type

With newer MESA (version 9.0.2 in Debian), the message

  [54588.405160] evergreen_packet3_check: 32 callbacks suppressed
  [54588.405166] radeon 0000:1d:00.0: vbo resource seems too big for the bo
  [54588.418034] radeon 0000:1d:00.0: vbo resource seems too big for the bo
  [54588.418037] radeon 0000:1d:00.0: vbo resource seems too big for the bo
  ...

floods dmesg and the ratelimiting doesn't help a whole lot. The user
can't really do anything about it so make it a once message.

Some background info from Alex:

"[O]lder GPUs did not support memory protection, so the kernel driver
validates all of the command submissions (CS) from userspace to make
sure the commands would not access any memory they shouldn't.

In your case it's a vertex buffer object (VBO) which contains vertex
data for the 3D engine on the GPU.  So newer mesa code is sending
a command submission with an invalid vbo size.  As such the kernel
driver rejects the command submission.

This may result in subtle rendering issues as the invalid command
submission does not get sent to the hardware.  I would suggest filing
a mesa bug report:

https://gitlab.freedesktop.org/mesa/mesa/-/issues"

So users are encouraged to report this bug if they catch it in their
dmesg.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local
---
 drivers/gpu/drm/radeon/evergreen_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index a46613283393..6285ff1b1bff 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -2418,7 +2418,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				size = radeon_get_ib_value(p, idx+1+(i*8)+1);
 				if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
 					/* force size to size of the buffer */
-					dev_warn_ratelimited(p->dev, "vbo resource seems too big for the bo\n");
+					dev_warn_once(p->dev, "vbo resource seems too big for the bo\n");
 					ib[idx+1+(i*8)+1] = radeon_bo_size(reloc->robj) - offset;
 				}
 
-- 
2.51.0



-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
