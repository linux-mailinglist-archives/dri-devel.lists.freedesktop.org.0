Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E9374C75
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 02:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37E6EC88;
	Thu,  6 May 2021 00:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782C86E517;
 Thu,  6 May 2021 00:34:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id bf4so4077237edb.11;
 Wed, 05 May 2021 17:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18BqkrX7xt4Yf3UFmr9shZNRV6wDMHPBelY48HBzuPA=;
 b=iw8odI0sojSZVPQKtEV2c687jICaLAdVLwWDAGbEXwTgDxRHBSSFOtNb8rGVfjQVk9
 Rz6keQ/HFo5viZHJ02EMEWBIhtvPIpN1J9QdzUiGSXiQ+80gQxzgEM7BB5otkwTNGm6l
 au6YPv51Nn3G6Njgkjjp39Y9UyaxBnlwNgkNIYhFYq67b3toxrO8UGc0g2ZdS706MVL+
 m4XVNP2+Go1+kgkeOwr/NtRlQLgAqbUBFe2rhxIiO9XfM9TwigIBrmosY77M39Djip1S
 WjwH2I8NCym11oqikZoCPifKMQ8ZXTSN1N59i4U2ctPJz4k7Y6lHnHinhJSGqfoQEllL
 XVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18BqkrX7xt4Yf3UFmr9shZNRV6wDMHPBelY48HBzuPA=;
 b=LobYHQGpcj2OHUi7r2kiP4sJFIofqghyXueDYDaNJNfbJzNS4mZQ/YRbCj4VbtOYBB
 dd+bRAZHKN9BXHnRX6AIyDv9J33WkDF8l2RUhv8RvykpTqA3foAxiqiYIvVuiwxdC0Pk
 mrXz1nTkNDjkDqsoUKuwcfj19zOcViI5G6k5KCiZ3e0+BlGMnswi42BplrodjCdDkij3
 g4CXytEL2hBOHfVfcFMUXKsf1YGfhvuVXiKmrg67EuYtYPwS5Q/pazTZ6fac+U9nIob8
 jbIYl/DUsCW7dD8T+2b5oFfip3YXVej1YhyDiQcBXXTVVhxMnOpx6U3e7oqz0MN2if84
 fDzg==
X-Gm-Message-State: AOAM530GufCCrK+KWb7PK3KjNG1KoK/SMVAhIETTvjJNzqV+g19K+hXs
 VZYeuaBg1dt/3REzUeQSJagthyBRS/C7XTSRtMQ=
X-Google-Smtp-Source: ABdhPJyH8kNBYzMtq8clNuw9IWOhEOOTDE5JxVv4Upulb53qBcTCfQEgIjEqJAwiWZh1I9s0PO4N21tmMmwOAaDgthQ=
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr1826893edu.11.1620261245059; 
 Wed, 05 May 2021 17:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <CAEsyxygq1k4pTT-8ASuJn=rSzHBXyhy5jRStoBVmniR2B_MrJg@mail.gmail.com>
 <CADnq5_OtKZ3=pZR_F4zx2Bz1zvEzuxb4fQU41c-XTBT8-H4Byw@mail.gmail.com>
 <CADnq5_P16wMm4gyZJYndkVtLs5n85o95u3jm6DdU7mN7+o6P9w@mail.gmail.com>
In-Reply-To: <CADnq5_P16wMm4gyZJYndkVtLs5n85o95u3jm6DdU7mN7+o6P9w@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 6 May 2021 02:33:53 +0200
Message-ID: <CAEsyxyizmnXXNs4Px3Hp+CkUbZ6TDA84+o-wXPwg73z=O17+Yg@mail.gmail.com>
Subject: Re: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000f4a24405c19e77a5"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f4a24405c19e77a5
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 11:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Apr 20, 2021 at 5:25 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Fri, Apr 16, 2021 at 12:29 PM Mario Kleiner
> > <mario.kleiner.de@gmail.com> wrote:
> > >
> > > Friendly ping to the AMD people. Nicholas, Harry, Alex, any feedback?
> > > Would be great to get this in sooner than later.
> > >
> >
> > No objections from me.
> >
>
> I don't have any objections to merging this.  Are the IGT tests available?
>
> Alex
>.

IGT Patches are out now, already r-b by Ville, cc'd to you. As
mentioned in the cover letter for those, the new 16 bpc test cases on
top o f IGT master for kms_plane test now work nicely on my
RavenRidge, but i had to add hacks on top of kms_plane test to make it
work at all on RV, ie. get it to the point where it could execute the
tests for the new formats at all. Unmodified kms_plane from master
doesn't even work on RV with Linux 5.8. Seems IGT is quite a bit out
of date wrt. the kernel?

Things i had to do:

- Skip all tests for modifiers other than linear. --> Test
requirements wrt. tiling not met. Seems all the modifier support for
DCC, DCC_RETILE on Vega+ is missing from IGT so far?

- Skip test for format DRM_FORMAT_RGB565. CRC mismatch. Probably
because a 5 bpc container can't represent the net 8 bpc content from
the reference test image? Maybe all tests for < 8 bpc formats should
be skipped?

- Skip tests for yuv planar formats with BT2020 color space: Limited
range unsupported by DC, full range causes CRC mismatch.

- Problems with crc vblank count expected vs. actual for planar YUV formats.

- If the tests try to test more than the primary plane,
igt_pipe_crc_start() fails to open the crtc/crc/data file with -EIO.

See the attached patch with all the needed hacks. Not sure which of
these are limitations of the IGT test, and which are amdgpu bugs or hw
limitations, but applying this hack-patch on top of the patches for
the new formats makes kms_plane pass.

-mario





> > Alex
> >
> >
> > > Thanks and have a nice weekend,
> > > -mario
> > >
> > > On Fri, Mar 19, 2021 at 10:03 PM Mario Kleiner
> > > <mario.kleiner.de@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > this patch series adds the fourcc's for 16 bit fixed point unorm
> > > > framebuffers to the core, and then an implementation for AMD gpu's
> > > > with DisplayCore.
> > > >
> > > > This is intended to allow for pageflipping to, and direct scanout of,
> > > > Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
> > > > I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
> > > > for swapchains, mapping to DRM_FORMAT_XBGR16161616:
> > > > Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4
> > > >
> > > > My main motivation for this is squeezing every bit of precision
> > > > out of the hardware for scientific and medical research applications,
> > > > where fp16 in the unorm range is limited to ~11 bpc effective linear
> > > > precision in the upper half [0.5;1.0] of the unorm range, although
> > > > the hardware could do at least 12 bpc.
> > > >
> > > > It has been successfully tested on AMD RavenRidge (DCN-1), and with
> > > > Polaris11 (DCE-11.2). Up to two displays were active on RavenRidge
> > > > (DP 2560x1440@144Hz + HDMI 2560x1440@120Hz), the maximum supported
> > > > on my hw, both running at 10 bpc DP output depth.
> > > >
> > > > Up to three displays were active on the Polaris (DP 2560x1440@144Hz +
> > > > 2560x1440@100Hz USB-C DP-altMode-to-HDMI converter + eDP 2880x1800@60Hz
> > > > Apple Retina panel), all running at 10 bpc output depth.
> > > >
> > > > No malfunctions, visual artifacts or other oddities were observed
> > > > (apart from an adventureous mess of cables and adapters on my desk),
> > > > suggesting it works.
> > > >
> > > > I used my automatic photometer measurement procedure to verify the
> > > > effective output precision of 10 bpc DP native signal + spatial
> > > > dithering in the gpu as enabled by the amdgpu driver. Results show
> > > > the expected 12 bpc precision i hoped for -- the current upper limit
> > > > for AMD display hw afaik.
> > > >
> > > > So it seems to work in the way i hoped :).
> > > >
> > > > Some open questions wrt. AMD DC, to be addressed in this patch series, or follow up
> > > > patches if neccessary:
> > > >
> > > > - For the atomic check for plane scaling, the current patch will
> > > > apply the same hw limits as for other rgb fixed point fb's, e.g.,
> > > > for 8 bpc rgb8. Is this correct? Or would we need to use the fp16
> > > > limits, because this is also a 64 bpp format? Or something new
> > > > entirely?
> > > >
> > > > - I haven't added the new fourcc to the DCC tables yet. Should i?
> > > >
> > > > - I had to change an assert for DCE to allow 36bpp linebuffers (patch 4/5).
> > > > It looks to me as if that assert was inconsistent with other places
> > > > in the driver where COLOR_DEPTH121212 is supported, and looking at
> > > > the code, the change seems harmless. At least on DCE-11.2 the change
> > > > didn't cause any noticeable (by myself) or measurable (by my equipment)
> > > > problems on any of the 3 connected displays.
> > > >
> > > > - Related to that change, while i needed to increase lb pixelsize to 36bpp
> > > > to get > 10 bpc effective precision on DCN, i didn't need to do that
> > > > on DCE. Also no change of lb pixelsize was needed on either DCN or DCe
> > > > to get > 10 bpc precision for fp16 framebuffers, so something seems to
> > > > behave differently for floating point 16 vs. fixed point 16. This all
> > > > seems to suggest one could leave lb pixelsize at the old 30 bpp value
> > > > on at least DCE-11.2 and still get the > 10 bpc precision if one wanted
> > > > to avoid the changes of patch 4/5.
> > > >
> > > > Thanks,
> > > > -mario
> > > >
> > > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000f4a24405c19e77a5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-kms_plane-Hacks-to-make-all-AMD-Raven-format-tests-p.patch"
Content-Disposition: attachment; 
	filename="0001-kms_plane-Hacks-to-make-all-AMD-Raven-format-tests-p.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_koc5c7rl0>
X-Attachment-Id: f_koc5c7rl0

RnJvbSAwOWYxOGMzOWJjYWZjZDg4NGNhZDQ3YzdmMzNlODkyYTU3YTJiZjUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJpbyBLbGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWls
LmNvbT4KRGF0ZTogU2F0LCAxIE1heSAyMDIxIDE2OjA2OjEyICswMjAwClN1YmplY3Q6IFtQQVRD
SCBpLWctdF0ga21zX3BsYW5lOiBIYWNrcyB0byBtYWtlIGFsbCBBTUQgUmF2ZW4gZm9ybWF0IHRl
c3RzCiBwYXNzLgoKVGhlc2UgY2F1c2UgZmFpbHVyZSBvZiBhdG9taWMgY29tbWl0IG9yIG90aGVy
IGFzc2VydHMgYW5kIGNhdXNlCnRoZSB0ZXN0cyB0byBhYm9ydDoKCi0gUHJvYmxlbXMgd2l0aCBj
cmMgdmJsYW5rIGNvdW50IGV4cGVjdGVkIHZzLiBhY3R1YWwgZm9yIHBsYW5hciBZVVYuCi0gTm8g
c3VwcG9ydCBmb3IgWVVWIEJUMjAyMCBsaW1pdGVkIHJhbmdlIGJ5IGFtZGdwdS4KLSBGYWlsdXJl
IG9mIGlndF9waXBlX2NyY19zdGFydCgpIGZvciBzZWNvbmRhcnkgcGxhbmVzLgotIE5vIHN1cHBv
cnQgZm9yIERDQyAvIERDQ19SRVRJTEUgbW9kaWZpZXJzIGludHJvZHVjZWQgaW4gTGludXggNS4x
MS4KClRoZXNlIGRvIG5vdCBjYXVzZSBhYm9ydCBvZiBhbGwgdGVzdHMgaWlyYy4sIGp1c3QgcmVw
b3J0aW5nIHRoZSBtaXNtYXRjaDoKCi0gQ1JDIG1pc21hdGNoIGZvciBZVVYgQlQyMDIwIGZ1bGwg
cmFuZ2UuCi0gQ1JDIG1pc21hdGNoIG9uIGFsbCBZVVYgZm9yIHNyYyBjcm9wIHRlc3QuCi0gQ1JD
IG1pc21hdGNoIGZvciAxNmJwcCBSR0I1NjUgZm9ybWF0LgotIHNyYyBjcm9wIHRlc3QgbmVlZHMg
MTYgcGl4ZWwgYm9yZGVycyBmb3IgNjRicHAgcmdiYTE2L2ZwMTYgZm9ybWF0cy4KLS0tCiB0ZXN0
cy9rbXNfcGxhbmUuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKaW5kZXggOWZlMjUzYTguLjZl
YjlhMTIyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcGxhbmUuYworKysgYi90ZXN0cy9rbXNfcGxh
bmUuYwpAQCAtNTUwLDcgKzU1MCw3IEBAIHN0YXRpYyB2b2lkIGNhcHR1cmVfY3JjKGRhdGFfdCAq
ZGF0YSwgdW5zaWduZWQgaW50IHZibGFuaywgaWd0X2NyY190ICpjcmMpCiAJaWd0X3BpcGVfY3Jj
X2dldF9mb3JfZnJhbWUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5waXBlX2NyYywgdmJsYW5rLCBjcmMp
OwogCiAJaWd0X2ZhaWxfb25fZighaWd0X3NraXBfY3JjX2NvbXBhcmUgJiYKLQkJICAgICAgY3Jj
LT5oYXNfdmFsaWRfZnJhbWUgJiYgY3JjLT5mcmFtZSAhPSB2YmxhbmssCisJCSAgICAgIGNyYy0+
aGFzX3ZhbGlkX2ZyYW1lICYmIGNyYy0+ZnJhbWUgIT0gKHZibGFuayArIChpc19hbWRncHVfZGV2
aWNlKGRhdGEtPmRybV9mZCkgPyAyIDogMCkpLAogCQkgICAgICAiR290IENSQyBmb3IgdGhlIHdy
b25nIGZyYW1lIChnb3QgJXUsIGV4cGVjdGVkICV1KS4gQ1JDIGJ1ZmZlciBvdmVyZmxvdz9cbiIs
CiAJCSAgICAgIGNyYy0+ZnJhbWUsIHZibGFuayk7CiB9CkBAIC03ODcsNiArNzg3LDE1IEBAIHN0
YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5lX3l1dihkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBw
aXBlLAogCQkJCQkJICAgICBpZ3RfY29sb3JfcmFuZ2VfdG9fc3RyKHIpKSkKIAkJCQljb250aW51
ZTsKIAorCQkJLyogQU1EIGNhbid0IGRvIElHVF9DT0xPUl9ZQ0JDUl9CVDIwMjAgd2l0aCBsaW1p
dGVkIHJhbmdlLCBvbmx5IGZ1bGwgcmFuZ2UsCisJCQkgKiBvdGhlcndpc2UgYXRvbWljIHRlc3Qg
ZmFpbHMgd2l0aCAtRUlOVkFMLgorCQkJICogV2l0aCBmdWxsIHJhbmdlLCB3ZSBzdGlsbCBnZXQg
Y3JjIG1pc21hdGNoLgorCQkJICogVGhlcmVmb3JlIHNraXAgSUdUX0NPTE9SX1lDQkNSX0JUMjAy
MCBlbmNvZGluZ3MuCisJCQkgKiBBbHNvIHNraXAgdGVzdHMgZm9yIHNyYyBjcm9wcGluZyB0ZXN0
IC0+IGNyYyBtaXNtYXRjaC4KKwkJCSAqLworCQkJaWYgKGlzX2FtZGdwdV9kZXZpY2UoZGF0YS0+
ZHJtX2ZkKSAmJiAoZSA9PSBJR1RfQ09MT1JfWUNCQ1JfQlQyMDIwIHx8IGRhdGEtPmNyb3ApKQor
CQkJCWNvbnRpbnVlOworCiAJCQlpZ3RfaW5mbygiVGVzdGluZyBmb3JtYXQgIiBJR1RfRk9STUFU
X0ZNVCAiIC8gbW9kaWZpZXIgMHglIiBQUkl4NjQgIiAoJXMsICVzKSBvbiAlcy4ldVxuIiwKIAkJ
CQkgSUdUX0ZPUk1BVF9BUkdTKGZvcm1hdCksIG1vZGlmaWVyLAogCQkJCSBpZ3RfY29sb3JfZW5j
b2RpbmdfdG9fc3RyKGUpLApAQCAtOTIxLDYgKzkzMCwxNSBAQCBzdGF0aWMgYm9vbCB0ZXN0X2Zv
cm1hdF9wbGFuZShkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLAogCQkgICAgZi5tb2RpZmll
ciA9PSByZWYubW9kaWZpZXIpCiAJCQljb250aW51ZTsKIAorCQkvKiBQcmV2ZW50IHVzZSBvZiB5
ZXQgdW5zdXBwb3J0ZWQgRENDIC8gRENDX1JFVElMRSBtb2RpZmllcnMgb24gR0ZYOSsgKi8KKwkJ
aWYgKGlzX2FtZGdwdV9kZXZpY2UoZGF0YS0+ZHJtX2ZkKSAmJiAoZi5tb2RpZmllciAhPSBEUk1f
Rk9STUFUX01PRF9MSU5FQVIpKQorCQkJY29udGludWU7CisKKwkJLyogRG9uJ3QgdGVzdCBmb3Jt
YXRzIHdoaWNoIG9ubHkgaG9sZCBsZXNzIHRoYW4gOCBicGMgb2YgY29udGVudCAqLworCQkvLyBP
ciAoaWd0X2RybV9mb3JtYXRfdG9fYnBwKGYuZm9ybWF0KSA9PSAxNiAmJiAhaWd0X2Zvcm1hdF9p
c195dXYoZi5mb3JtYXQpKSBmb3Igc2tpcCBkdWUgdG8gPCA4IGJwYz8KKwkJaWYgKGYuZm9ybWF0
ID09IERSTV9GT1JNQVRfUkdCNTY1KQorCQkJY29udGludWU7CisKIAkJLyogdGVzdCBlYWNoIGZv
cm1hdCAiY2xhc3MiIG9ubHkgb25jZSBpbiBub24tZXh0ZW5kZWQgdGVzdHMgKi8KIAkJaWYgKCFk
YXRhLT5leHRlbmRlZCAmJiBmLm1vZGlmaWVyICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUikgewog
CQkJc3RydWN0IGZvcm1hdF9tb2QgcmYgPSB7CkBAIC05ODEsNiArOTk5LDE0IEBAIHN0YXRpYyBi
b29sIHNraXBfcGxhbmUoZGF0YV90ICpkYXRhLCBpZ3RfcGxhbmVfdCAqcGxhbmUpCiAJaWYgKGRh
dGEtPmV4dGVuZGVkKQogCQlyZXR1cm4gZmFsc2U7CiAKKwkvKiBpZ3RfcGlwZV9jcmNfc3RhcnQo
KSBmYWlscyBmb3IgZnV0aGVyIHBsYW5lcywgc28gb25seSB0ZXN0IHByaW1hcnkgcGxhbmUuCisJ
ICogVGhlIGVycm9yIGlzIGEgLUVJTyBlcnJvciB3aGVuIG9wZW5pbmcgdGhlIC4uL2NydGMvY3Jj
L2RhdGEgZmlsZSwgd2hpY2gKKwkgKiBzdWdnZXN0cyB0aGF0IHRoZSBEUk0gY3J0Y19jcmNfb3Bl
bigpIGZ1bmN0aW9uIHJlamVjdHMgb3BlbiwgYmVjYXVzZSB0aGUKKwkgKiBhc3NvY2lhdGVkIGNy
dGMgaXMgKCFjcnRjLT5zdGF0ZS0+YWN0aXZlKT8KKwkgKi8KKwlpZiAoaXNfYW1kZ3B1X2Rldmlj
ZShkYXRhLT5kcm1fZmQpICYmIChwbGFuZS0+dHlwZSAhPSBEUk1fUExBTkVfVFlQRV9QUklNQVJZ
KSkKKwkJcmV0dXJuIHRydWU7CisKIAlpZiAoIWlzX2k5MTVfZGV2aWNlKGRhdGEtPmRybV9mZCkp
CiAJCXJldHVybiBmYWxzZTsKIApAQCAtMTA3Myw3ICsxMDk5LDggQEAgcnVuX3Rlc3RzX2Zvcl9w
aXBlX3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUpCiAJaWd0X2Rlc2NyaWJlKCJ2
ZXJpZnkgdGhlIHBpeGVsIGZvcm1hdHMgZm9yIGdpdmVuIHBsYW5lIGFuZCBwaXBlIHdpdGggc291
cmNlIGNsYW1waW5nIik7CiAJaWd0X3N1YnRlc3RfZigicGl4ZWwtZm9ybWF0LXBpcGUtJXMtcGxh
bmVzLXNvdXJjZS1jbGFtcGluZyIsCiAJCSAgICAgIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpKSB7
Ci0JCWRhdGEtPmNyb3AgPSA0OworCQkvKiBBdCBsZWFzdCBBTUQgbmVlZHMgY3JvcCB0byBiZSBt
dWx0aXBsZSBvZiAxNiBmb3IgNjRicHAgcGl4ZWwgZm9ybWF0cyAqLworCQlkYXRhLT5jcm9wID0g
NCAqIChpc19hbWRncHVfZGV2aWNlKGRhdGEtPmRybV9mZCkgPyA0IDogMSk7CiAJCXRlc3RfcGl4
ZWxfZm9ybWF0cyhkYXRhLCBwaXBlKTsKIAl9CiAKLS0gCjIuMjUuMQoK
--000000000000f4a24405c19e77a5--
