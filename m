Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16A49D06E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 18:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7010E5BC;
	Wed, 26 Jan 2022 17:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E3310E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 17:11:19 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id k31so805325ybj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 09:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzJHhJleSWqF14ZWukjXdo49B2n+jMNE6xZJikDyEFM=;
 b=csHD+VsHWKdR8RcftfC1cWYXNUbWeOgpwIdaL1IJ8DLTDqXWTwPpq6dWxw4Hart5e+
 MdpI9HZPFa5MeWZ5Zlh74DV2tZ/AuqA/AzsRtpxPH3UzszV48L8NY5uIjDXsxxIPrLFJ
 58fBW7t9w7avVXwFInbn3UEWH1RgKsq06JA7fxs4i4ZL+ZZe/pt3et10waSxe8yN8SJz
 V3E0rvZSDk5st9rob9bwpDRzjybyBDpJmLEUnOdlLUv2ucFELuHOVgj3Lui2kaB2WFHK
 M5808rlWgQAJmT6QiRgWAq6JRkgpygrMexiqs8YcExLLSfaAG21r9GBvPUVeOOciHzp3
 j/hw==
X-Gm-Message-State: AOAM5318CHZSai6ehQxWM2a1wUS8xBQJx5OyAYrH0TImU+ERximmYTtI
 tEuHIT/xj2DAyy9dZ2C38qE0kN9EzhJIbm+2KPI=
X-Google-Smtp-Source: ABdhPJw9ZW3cL9vDSZBWr9fEd5TBzMzfmUkCiWNCvwBVkPc07T31xGpqLjJsBBez807kDQGA6D1N8ISHXLb3q/gjQn0=
X-Received: by 2002:a25:bb93:: with SMTP id y19mr37487436ybg.466.1643217078886; 
 Wed, 26 Jan 2022 09:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
 <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
 <049ccc3a-8628-3e90-a4f4-137a286b6dce@redhat.com>
In-Reply-To: <049ccc3a-8628-3e90-a4f4-137a286b6dce@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Jan 2022 18:11:07 +0100
Message-ID: <CAJZ5v0hJWW_vZ3wwajE7xT38aWjY7cZyvqMJpXHzUL98-SiCVQ@mail.gmail.com>
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="00000000000047c38c05d67f4ab9"
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Tong Zhang <ztong0001@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000047c38c05d67f4ab9
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 5:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/26/22 16:54, Rafael J. Wysocki wrote:
> > On Wed, Jan 26, 2022 at 2:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi All,
> >>
> >> On 1/23/22 10:10, Tong Zhang wrote:
> >>> when acpi=off is provided in bootarg, kernel crash with
> >>>
> >>> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
> >>> [    1.258308] Call Trace:
> >>> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
> >>> [    1.258770]  acpi_get_devices+0xe4/0x137
> >>> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
> >>> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
> >>> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
> >>>
> >>> The reason is that acpi_walk_namespace expects acpi related stuff
> >>> initialized but in fact it wouldn't when acpi is set to off. In this case
> >>> we should honor acpi=off in detect_thinkpad_privacy_screen().
> >>>
> >>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> >>
> >> Thank you for catching this and thank you for your patch. I was about to merge
> >> this, but then I realized that this might not be the best way to fix this.
> >>
> >> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
> >> and at a first glance about half of those are missing an acpi_disabled
> >> check. IMHO it would be better to simply add an acpi_disabled check to
> >> acpi_get_devices() itself.
> >>
> >> Rafael, do you agree ?
> >
> > Yes, I do.
>
> Did you see my follow-up that that is not going to work because
> acpi_get_devices() is an acpica function ?

No, I didn't, but it is possible to add a wrapper doing the check
around it and convert all of the users.

Alternatively, the ACPICA function can check acpi_gbl_root_node
against NULL, like in the attached (untested) patch.

--00000000000047c38c05d67f4ab9
Content-Type: text/x-patch; charset="US-ASCII"; name="acpica-check-root-in-walks.patch"
Content-Disposition: attachment; filename="acpica-check-root-in-walks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kyvszwmw0>
X-Attachment-Id: f_kyvszwmw0

LS0tCiBkcml2ZXJzL2FjcGkvYWNwaWNhL25zd2Fsay5jIHwgICAgMyArKysKIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCkluZGV4OiBsaW51eC1wbS9kcml2ZXJzL2FjcGkvYWNwaWNh
L25zd2Fsay5jCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KLS0tIGxpbnV4LXBtLm9yaWcvZHJpdmVycy9hY3BpL2FjcGlj
YS9uc3dhbGsuYworKysgbGludXgtcG0vZHJpdmVycy9hY3BpL2FjcGljYS9uc3dhbGsuYwpAQCAt
MTY5LDYgKzE2OSw5IEBAIGFjcGlfbnNfd2Fsa19uYW1lc3BhY2UoYWNwaV9vYmplY3RfdHlwZQog
CiAJaWYgKHN0YXJ0X25vZGUgPT0gQUNQSV9ST09UX09CSkVDVCkgewogCQlzdGFydF9ub2RlID0g
YWNwaV9nYmxfcm9vdF9ub2RlOworCQlpZiAoIXN0YXJ0X25vZGUpIHsKKwkJCXJldHVybl9BQ1BJ
X1NUQVRVUyhBRV9OT19OQU1FU1BBQ0UpOworCQl9CiAJfQogCiAJLyogTnVsbCBjaGlsZCBtZWFu
cyAiZ2V0IGZpcnN0IG5vZGUiICovCg==
--00000000000047c38c05d67f4ab9--
