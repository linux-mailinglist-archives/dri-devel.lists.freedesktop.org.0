Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB122D412B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 12:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D706EA02;
	Wed,  9 Dec 2020 11:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A83A6EA02
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:33:54 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 4so782023plk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 03:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nes0rcZuTwmOxtwOikKB2O8R1AmvIbu+0dxh8W69ZI4=;
 b=G7cBFz8V5bYKV/tYPiKBAf7ZuEueNDSI9R2RSC0QmUtnucEhxcU7hhSDzkuND627RA
 j9Us9+dJHv670BVlglnG6W88jVqDqj+oV0d3i7hRkVtOOEjlWlbHipTEBozyMRJWGx2X
 SEUerN1AhgMR9uOVgHgG7UAGmfQozfpzQEi5JFnQLp8B69UgGZ5X0r64m1+HFwHnYeN5
 yLZxtzpgCqrb4mzT7HezYZHW3u7NqQROhvI/q5V9Ah64t0Yot9rb7sFaZQ7yvo0sI3Fa
 PGn9kSm8wAMtvoKlPUkltL3GxsZkLx00Ufp9WA2Tms7wwO2LlV4ZydaKriNUlhvv5pyk
 9e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nes0rcZuTwmOxtwOikKB2O8R1AmvIbu+0dxh8W69ZI4=;
 b=oFz45au8xLz0zeEeB/42XWF5ofiM8xeVsvet2A6Kr9uVpD3PMfk14Cc9ESaU5zcXzB
 ToJq1OWXayZYspTPFctRcgfaM9LBfi3nnBJ3hafmQq9ap0/hxLU2H1nvfc9PIe3KclZd
 YLK8PXcRLmYgr2rraCkhis74bCBp1u+v850qOz5U+SMSDWKWufSzyquHYtGr88AnQP4g
 3JgL06Bw9BVy2sWJ9iWRoWiKVb0VAFoHMa8K7h6q0cbFMgjv1+58E6qJShxJfEY1k4on
 jJpB+lzqhqXnWor+ZgRn92h7iAuKL8bRzkva6VZrF/L2PjymhFtvGHYS4IX40P6A1qBj
 oHqg==
X-Gm-Message-State: AOAM5333aiNqbuXJTbSxW/d54va1kCWVh58QhTgjWzZYCZG/+0C+RIqn
 XeWfSLcHD8RSaLS0o2h+auRTS5/HWcJzAf598B8=
X-Google-Smtp-Source: ABdhPJwnF7pdFp+k9sJD0dR08jXoXLnuvwsQmdL87HSHQ3hPUJWW6G77aImei/0aYE74ufCDo/ZC6CHFgFRLgQkR99s=
X-Received: by 2002:a17:902:ee11:b029:db:c0d6:581a with SMTP id
 z17-20020a170902ee11b02900dbc0d6581amr1631361plb.54.1607513633716; Wed, 09
 Dec 2020 03:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20201208203735.ukqrgjmlntbvxc7e@adolin>
 <20201209005408.GP401619@phenom.ffwll.local>
In-Reply-To: <20201209005408.GP401619@phenom.ffwll.local>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Wed, 9 Dec 2020 17:03:42 +0530
Message-ID: <CACAkLuqvHw898DBYo3TgaTr5_6Mr=p=CXaBzFo_7P8N5geOZyw@mail.gmail.com>
Subject: Re: [PATCH V2] drm/vkms: Add setup and testing information
To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, 
 David Airlie <airlied@linux.ie>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000001c25d105b6066f37"
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

--0000000000001c25d105b6066f37
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 6:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Dec 09, 2020 at 02:07:35AM +0530, Sumera Priyadarsini wrote:
> > Update the vkms documentation to contain steps to:
> >
> >  - setup the vkms driver
> >  - run tests using igt
> >
> > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > ___
> > Changes in v2:
> >  - Change heading to title case (Daniel)
> >  - Add examples to run tests directly (Daniel)
> >  - Add examples to run subtests (Melissa)
> > ---
> >  Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index 13bab1d93bb3..d6739fbbe503 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -7,6 +7,73 @@
> >  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
> >     :doc: vkms (Virtual Kernel Modesetting)
> >
> > +Setup
> > +=====
> > +
> > +The VKMS driver can be setup with the following steps:
> > +
> > +To check if VKMS is loaded, run::
> > +
> > +  lsmod | grep vkms
> > +
> > +This should list the VKMS driver. If no output is obtained, then
> > +you need to enable and/or load the VKMS driver.
> > +Ensure that the VKMS driver has been set as a loadable module in your
> > +kernel config file. Do::
> > +
> > +  make nconfig
> > +
> > +  Go to `Device Drivers> Graphics support`
> > +
> > +  Enable `Virtual KMS (EXPERIMENTAL)`
> > +
> > +Compile and build the kernel for the changes to get reflected.
> > +Now, to load the driver, use::
> > +
> > +  sudo modprobe vkms
> > +
> > +On running the lsmod command now, the VKMS driver will appear listed.
> > +You can also observe the driver being loaded in the dmesg logs.
> > +
> > +To disable the driver, use ::
> > +
> > +  sudo modprobe -r vkms
> > +
> > +Testing With IGT
> > +================
> > +
> > +The IGT GPU Tools is a test suite used specifically for debugging and
> > +development of the DRM drivers.
> > +The IGT Tools can be installed from
> > +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> > +
> > +The tests need to be run without a compositor, so you need to switch to text
> > +only mode. You can do this by::
> > +
> > +  sudo systemctl isolate multi-user.target
> > +
> > +To return to graphical mode, do::
> > +
> > +  sudo systemctl isolate graphical.target
> > +
> > +Once you are in text only mode, you can run tests using the --device switch
> > +or IGT_DEVICE variable to specify the device filter for the driver we want
> > +to test::
> > +
> > +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> > +
> > +For example, to test the functionality of the writeback library,
> > +we can run the kms_writeback test::
> > +
> > +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> > +
> > +You can also run subtests if you do not want to run the entire test::
> > +
> > +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
>
> Does IGT_DEVICE also work with run-tests.sh? Aside from my curious
> question, patch looks good to me, thanks a lot.

Good catch, it does.

Melissa, IGT_FORCE_DRIVER also works. I think I was used test/kms_flip
earlier instead of
./build/test/kms_flip hence the fluke.

Should I add these also to the docs, was wondering if it will get too
confusing....

>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > +
> >  TODO
> >  ====
> >
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--0000000000001c25d105b6066f37
Content-Type: text/markdown; charset="US-ASCII"; name="withruntest.md"
Content-Disposition: attachment; filename="withruntest.md"
Content-Transfer-Encoding: base64
Content-ID: <f_kihc3ewc0>
X-Attachment-Id: f_kihc3ewc0

YHN1ZG8gSUdUX0RFVklDRT0ic3lzOi9zeXMvZGV2aWNlcy9wbGF0Zm9ybS92a21zIiAuL3Njcmlw
dHMvcnVuLXRlc3RzLnNoIC10IGttc193cml0ZWJhY2tgCgpbOTQ0NS4zMTc5OTNdIFsxLzRdIGtt
c193cml0ZWJhY2sgKHdyaXRlYmFjay1waXhlbC1mb3JtYXRzKQpbOTQ0NS42MjM0OTldIFsyLzRd
IGttc193cml0ZWJhY2sgKHdyaXRlYmFjay1pbnZhbGlkLXBhcmFtZXRlcnMpCls5NDQ3LjA3NjI2
M10gWzMvNF0ga21zX3dyaXRlYmFjayAod3JpdGViYWNrLWZiLWlkKQpbOTQ0Ny4zNzE0MDJdIFs0
LzRdIGttc193cml0ZWJhY2sgKHdyaXRlYmFjay1jaGVjay1vdXRwdXQpCkRvbmUuCgoKCmBzdWRv
IElHVF9ERVZJQ0U9InN5czovc3lzL2RldmljZXMvcGxhdGZvcm0vdmttcyIgLi9idWlsZC90ZXN0
cy9rbXNfd3JpdGViYWNrYAoKSUdULVZlcnNpb246IDEuMjUtZ2MzNmY3OTczICh4ODZfNjQpIChM
aW51eDogNS4xMC4wLXJjMmRybXN1bW8rIHg4Nl82NCkKU3RhcnRpbmcgc3VidGVzdDogd3JpdGVi
YWNrLXBpeGVsLWZvcm1hdHMKU3VidGVzdCB3cml0ZWJhY2stcGl4ZWwtZm9ybWF0czogU1VDQ0VT
UyAoMC4wMDBzKQpTdGFydGluZyBzdWJ0ZXN0OiB3cml0ZWJhY2staW52YWxpZC1wYXJhbWV0ZXJz
ClN1YnRlc3Qgd3JpdGViYWNrLWludmFsaWQtcGFyYW1ldGVyczogU1VDQ0VTUyAoMC4wMDBzKQpT
dGFydGluZyBzdWJ0ZXN0OiB3cml0ZWJhY2stZmItaWQKU3VidGVzdCB3cml0ZWJhY2stZmItaWQ6
IFNVQ0NFU1MgKDAuMDE3cykKU3RhcnRpbmcgc3VidGVzdDogd3JpdGViYWNrLWNoZWNrLW91dHB1
dApTdWJ0ZXN0IHdyaXRlYmFjay1jaGVjay1vdXRwdXQ6IFNVQ0NFU1MgKDAuMTI1cykKCmBzdWRv
IElHVF9GT1JDRV9EUklWRVI9dmttcyBidWlsZC90ZXN0cy9rbXNfd3JpdGViYWNrYAoKSUdULVZl
cnNpb246IDEuMjUtZ2MzNmY3OTczICh4ODZfNjQpIChMaW51eDogNS4xMC4wLXJjMmRybXN1bW8r
IHg4Nl82NCkKU3RhcnRpbmcgc3VidGVzdDogd3JpdGViYWNrLXBpeGVsLWZvcm1hdHMKU3VidGVz
dCB3cml0ZWJhY2stcGl4ZWwtZm9ybWF0czogU1VDQ0VTUyAoMC4wMDBzKQpTdGFydGluZyBzdWJ0
ZXN0OiB3cml0ZWJhY2staW52YWxpZC1wYXJhbWV0ZXJzClN1YnRlc3Qgd3JpdGViYWNrLWludmFs
aWQtcGFyYW1ldGVyczogU1VDQ0VTUyAoMC4wMDBzKQpTdGFydGluZyBzdWJ0ZXN0OiB3cml0ZWJh
Y2stZmItaWQKU3VidGVzdCB3cml0ZWJhY2stZmItaWQ6IFNVQ0NFU1MgKDAuMDE3cykKU3RhcnRp
bmcgc3VidGVzdDogd3JpdGViYWNrLWNoZWNrLW91dHB1dApTdWJ0ZXN0IHdyaXRlYmFjay1jaGVj
ay1vdXRwdXQ6IFNVQ0NFU1MgKDAuMTI2cykK
--0000000000001c25d105b6066f37
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--0000000000001c25d105b6066f37--
