Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF462CE0C2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 22:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156F46EC1F;
	Thu,  3 Dec 2020 21:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1617E6E090;
 Thu,  3 Dec 2020 21:31:02 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k26so3855251oiw.0;
 Thu, 03 Dec 2020 13:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5snprtQ5RbPFIdMa7mlq3tTYtljK6Vxfzd6/hBdueM=;
 b=mxfKHd7rsEIVcb1HbfsKtodrfF9bjPzPKa2qykDifdUMaxuf/EaMQD4t5pZWe1gYN6
 hZbr91qL4r1MA0gHCkIncfbVyLnxaS3n0nq5KSSZXNKGjVKCZhyjLnHK8mvzET7WtzUv
 FaFz+X6aQy93FSID0FAMLBqYaQ515Z+QZiavky0zOq4C9NNDgj7WwyasxnCq/TnNTZzd
 hVHkyVcX6GF4XXUsxwTezdqquJNjUDOqGJ05/4WKTyaRe9wsMhk2jhlOQSdlWvdageYa
 oeFudB3GQuLySzQ7WRgO93zU9eVKv8JNfvLofwo4Vyzv2JYb8tJ0vPcT0qB2BrTA9wi9
 fm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5snprtQ5RbPFIdMa7mlq3tTYtljK6Vxfzd6/hBdueM=;
 b=ZV7zWh24ugqmsuz6xXxBwLOKDsNVBbuYf/LaTNqYD+CCYiCtPIq1BMBsLCScIpwhqK
 XEFOIJKRH7yIVyjuVN/bb5LiTcwFJs3xzkwqyPXPf84VY9kGQ7L/wD2Qf0T3ySNMXknA
 hV2HdEVhauIm8ug9Pk99jjfhVF9BoE4YcHX4Wf10lCjQsJKCzywT7jn2Rrhe7x6xctGF
 Ec9JoTbEcA98E8VGPDkXYukR0OOCAAIBQ7DFPscxQg1jPAQnMkaNydALc3UbTMvwiWWs
 3Pl+jbW9XbRCIWFUdGKCUUXdO4h0IW1S7d8pt6BnGcq9dzEQvLmRQjM2DPzRzTmgKm8R
 AyPA==
X-Gm-Message-State: AOAM530A8oMM9NOLBpao7pQB4yv6ycMqeKl2Aa+ukbIrXKZlw4vUaYcm
 i4sB+/l+cbB1JaWjU2tmVC2VWNw8wull5pwkUKg=
X-Google-Smtp-Source: ABdhPJw3LFvTy1Ja3Qj6xk8rx8bAZCESCnsgsAgm5frPBYTqipaquW6fLTDfmjKXkPUEs5aIGtVj7VW02AtO8oMja64=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr811243oib.120.1607031061417; 
 Thu, 03 Dec 2020 13:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-7-ville.syrjala@linux.intel.com>
 <20200211170429.GM2363188@phenom.ffwll.local>
 <f61d40ca-4d09-5fbe-6bbf-ab59d060b085@web.de>
 <CAKMK7uEC+nTWui9U+0jDSUnJ3ih0b1S4TBeOo7-MoHHagOh+Cg@mail.gmail.com>
 <MN2PR12MB44880FE75B52D68700B73580F7270@MN2PR12MB4488.namprd12.prod.outlook.com>
 <14829fe8-b6be-8c57-300e-c16b5c0970e8@web.de>
 <CADnq5_PPPbVwRmDP8wLw2VomfD6HVENL7iGeapNdOjzedCLyAg@mail.gmail.com>
In-Reply-To: <CADnq5_PPPbVwRmDP8wLw2VomfD6HVENL7iGeapNdOjzedCLyAg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Dec 2020 16:30:50 -0500
Message-ID: <CADnq5_O7cgHO=tB+a2R2KP6STt8EOgAG7CU-BfMvxaO2o3RsxQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: Validate encoder->possible_crtcs
To: Jan Kiszka <jan.kiszka@web.de>
Content-Type: multipart/mixed; boundary="0000000000008f702205b5961337"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008f702205b5961337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 4:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Sep 29, 2020 at 8:31 AM Jan Kiszka <jan.kiszka@web.de> wrote:
> >
> > On 10.09.20 20:18, Deucher, Alexander wrote:
> > > [AMD Public Use]
> > >
> > >
> > >
> > >> -----Original Message-----
> > >> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > >> Daniel Vetter
> > >> Sent: Monday, September 7, 2020 3:15 AM
> > >> To: Jan Kiszka <jan.kiszka@web.de>; amd-gfx list <amd-
> > >> gfx@lists.freedesktop.org>; Wentland, Harry <Harry.Wentland@amd.com>=
;
> > >> Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> > >> Cc: dri-devel <dri-devel@lists.freedesktop.org>; intel-gfx <intel-
> > >> gfx@lists.freedesktop.org>; Thomas Zimmermann
> > >> <tzimmermann@suse.de>; Ville Syrjala <ville.syrjala@linux.intel.com>
> > >> Subject: Re: [PATCH v3 6/7] drm: Validate encoder->possible_crtcs
> > >>
> > >> On Sun, Sep 6, 2020 at 1:19 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> > >>>
> > >>> On 11.02.20 18:04, Daniel Vetter wrote:
> > >>>> On Tue, Feb 11, 2020 at 06:22:07PM +0200, Ville Syrjala wrote:
> > >>>>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >>>>>
> > >>>>> WARN if the encoder possible_crtcs is effectively empty or contai=
ns
> > >>>>> bits for non-existing crtcs.
> > >>>>>
> > >>>>> v2: Move to drm_mode_config_validate() (Daniel)
> > >>>>>     Make the docs say we WARN when this is wrong (Daniel)
> > >>>>>     Extract full_crtc_mask()
> > >>>>>
> > >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >>>>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel=
.com>
> > >>>>
> > >>>> When pushing the fixup needs to be applied before the validation
> > >>>> patch here, because we don't want to anger the bisect gods.
> > >>>>
> > >>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >>>>
> > >>>> I think with the fixup we should be good enough with the existing
> > >>>> nonsense in drivers. Fingers crossed.
> > >>>> -Daniel
> > >>>>
> > >>>>
> > >>>>> ---
> > >>>>>  drivers/gpu/drm/drm_mode_config.c | 27
> > >> ++++++++++++++++++++++++++-
> > >>>>>  include/drm/drm_encoder.h         |  2 +-
> > >>>>>  2 files changed, 27 insertions(+), 2 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/drm_mode_config.c
> > >>>>> b/drivers/gpu/drm/drm_mode_config.c
> > >>>>> index afc91447293a..4c1b350ddb95 100644
> > >>>>> --- a/drivers/gpu/drm/drm_mode_config.c
> > >>>>> +++ b/drivers/gpu/drm/drm_mode_config.c
> > >>>>> @@ -581,6 +581,29 @@ static void
> > >> validate_encoder_possible_clones(struct drm_encoder *encoder)
> > >>>>>           encoder->possible_clones, encoder_mask);  }
> > >>>>>
> > >>>>> +static u32 full_crtc_mask(struct drm_device *dev) {
> > >>>>> +    struct drm_crtc *crtc;
> > >>>>> +    u32 crtc_mask =3D 0;
> > >>>>> +
> > >>>>> +    drm_for_each_crtc(crtc, dev)
> > >>>>> +            crtc_mask |=3D drm_crtc_mask(crtc);
> > >>>>> +
> > >>>>> +    return crtc_mask;
> > >>>>> +}
> > >>>>> +
> > >>>>> +static void validate_encoder_possible_crtcs(struct drm_encoder
> > >>>>> +*encoder) {
> > >>>>> +    u32 crtc_mask =3D full_crtc_mask(encoder->dev);
> > >>>>> +
> > >>>>> +    WARN((encoder->possible_crtcs & crtc_mask) =3D=3D 0 ||
> > >>>>> +         (encoder->possible_crtcs & ~crtc_mask) !=3D 0,
> > >>>>> +         "Bogus possible_crtcs: "
> > >>>>> +         "[ENCODER:%d:%s] possible_crtcs=3D0x%x (full crtc mask=
=3D0x%x)\n",
> > >>>>> +         encoder->base.id, encoder->name,
> > >>>>> +         encoder->possible_crtcs, crtc_mask); }
> > >>>>> +
> > >>>>>  void drm_mode_config_validate(struct drm_device *dev)  {
> > >>>>>      struct drm_encoder *encoder;
> > >>>>> @@ -588,6 +611,8 @@ void drm_mode_config_validate(struct
> > >> drm_device *dev)
> > >>>>>      drm_for_each_encoder(encoder, dev)
> > >>>>>              fixup_encoder_possible_clones(encoder);
> > >>>>>
> > >>>>> -    drm_for_each_encoder(encoder, dev)
> > >>>>> +    drm_for_each_encoder(encoder, dev) {
> > >>>>>              validate_encoder_possible_clones(encoder);
> > >>>>> +            validate_encoder_possible_crtcs(encoder);
> > >>>>> +    }
> > >>>>>  }
> > >>>>> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.=
h
> > >>>>> index 3741963b9587..b236269f41ac 100644
> > >>>>> --- a/include/drm/drm_encoder.h
> > >>>>> +++ b/include/drm/drm_encoder.h
> > >>>>> @@ -142,7 +142,7 @@ struct drm_encoder {
> > >>>>>       * the bits for all &drm_crtc objects this encoder can be co=
nnected to
> > >>>>>       * before calling drm_dev_register().
> > >>>>>       *
> > >>>>> -     * In reality almost every driver gets this wrong.
> > >>>>> +     * You will get a WARN if you get this wrong in the driver.
> > >>>>>       *
> > >>>>>       * Note that since CRTC objects can't be hotplugged the assi=
gned
> > >> indices
> > >>>>>       * are stable and hence known before registering all objects=
.
> > >>>>> --
> > >>>>> 2.24.1
> > >>>>>
> > >>>>
> > >>>
> > >>> Triggers on an Advantech AIMB-228 (R1505G, 3 DP outputs):
> > >>
> > >> Adding amdgpu display folks.
> > >
> > > I took a quick look at this and it looks like we limit the number of =
crtcs later in the mode init process if the number of physical displays can=
't actually use more crtcs.  E.g., the physical board configuration would o=
nly allow for 3 active displays even if the hardware technically supports 4=
 crtcs.  I presume that way we can just leave the additional hardware power=
 gated all the time.
> > >
> >
> > So, will this be fixed any time soon? I don't feel qualified writing
> > such a patch but I would obviously be happy to test one.
>
> It's harmless, but I'll send out a patch soon.

I believe the attached patch should fix this.

Alex

--0000000000008f702205b5961337
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-disply-set-num_crtc-earlier.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-disply-set-num_crtc-earlier.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ki9csftq0>
X-Attachment-Id: f_ki9csftq0

RnJvbSA0NDFkMjNhOTcwMGNlMmQwM2Q4ZDg5Njg2YTk1YTlhNjUwMGQ4NjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgMyBEZWMgMjAyMCAxNjowNjoyNiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHUvZGlzcGx5OiBzZXQgbnVtX2NydGMgZWFybGllcgoKVG8gYXZvaWQgYSByZWNl
bnRseSBhZGRlZCB3YXJuaW5nOgogQm9ndXMgcG9zc2libGVfY3J0Y3M6IFtFTkNPREVSOjY1OlRN
RFMtNjVdIHBvc3NpYmxlX2NydGNzPTB4ZiAoZnVsbCBjcnRjIG1hc2s9MHg3KQogV0FSTklORzog
Q1BVOiAzIFBJRDogNDM5IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYzo2MTcg
ZHJtX21vZGVfY29uZmlnX3ZhbGlkYXRlKzB4MTc4LzB4MjAwIFtkcm1dCkluIHRoaXMgY2FzZSB0
aGUgd2FybmluZyBpcyBoYXJtbGVzcywgYnV0IGNvbmZ1c2luZyB0byB1c2Vycy4KClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5k
ZXggMzEzNTAxY2MzOWZjLi4xZWM1N2JjNzk4ZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMTEzMCw5ICsxMTMwLDYgQEAg
c3RhdGljIGludCBhbWRncHVfZG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJ
Z290byBlcnJvcjsKIAl9CiAKLQkvKiBVcGRhdGUgdGhlIGFjdHVhbCB1c2VkIG51bWJlciBvZiBj
cnRjICovCi0JYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjID0gYWRldi0+ZG0uZGlzcGxheV9pbmRl
eGVzX251bTsKLQogCS8qIGNyZWF0ZSBmYWtlIGVuY29kZXJzIGZvciBNU1QgKi8KIAlkbV9kcF9j
cmVhdGVfZmFrZV9tc3RfZW5jb2RlcnMoYWRldik7CiAKQEAgLTMzNjQsNiArMzM2MSwxMCBAQCBz
dGF0aWMgaW50IGFtZGdwdV9kbV9pbml0aWFsaXplX2RybV9kZXZpY2Uoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAJZW51bSBkY19jb25uZWN0aW9uX3R5cGUgbmV3X2Nvbm5lY3Rpb25fdHlw
ZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsKIAljb25zdCBzdHJ1Y3QgZGNfcGxhbmVfY2FwICpwbGFu
ZTsKIAorCWRtLT5kaXNwbGF5X2luZGV4ZXNfbnVtID0gZG0tPmRjLT5jYXBzLm1heF9zdHJlYW1z
OworCS8qIFVwZGF0ZSB0aGUgYWN0dWFsIHVzZWQgbnVtYmVyIG9mIGNydGMgKi8KKwlhZGV2LT5t
b2RlX2luZm8ubnVtX2NydGMgPSBhZGV2LT5kbS5kaXNwbGF5X2luZGV4ZXNfbnVtOworCiAJbGlu
a19jbnQgPSBkbS0+ZGMtPmNhcHMubWF4X2xpbmtzOwogCWlmIChhbWRncHVfZG1fbW9kZV9jb25m
aWdfaW5pdChkbS0+YWRldikpIHsKIAkJRFJNX0VSUk9SKCJETTogRmFpbGVkIHRvIGluaXRpYWxp
emUgbW9kZSBjb25maWdcbiIpOwpAQCAtMzQyNSw4ICszNDI2LDYgQEAgc3RhdGljIGludCBhbWRn
cHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQkJZ290byBmYWlsOwogCQl9CiAKLQlkbS0+ZGlzcGxheV9pbmRleGVzX251bSA9IGRtLT5kYy0+
Y2Fwcy5tYXhfc3RyZWFtczsKLQogCS8qIGxvb3BzIG92ZXIgYWxsIGNvbm5lY3RvcnMgb24gdGhl
IGJvYXJkICovCiAJZm9yIChpID0gMDsgaSA8IGxpbmtfY250OyBpKyspIHsKIAkJc3RydWN0IGRj
X2xpbmsgKmxpbmsgPSBOVUxMOwotLSAKMi4yNS40Cgo=
--0000000000008f702205b5961337
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--0000000000008f702205b5961337--
