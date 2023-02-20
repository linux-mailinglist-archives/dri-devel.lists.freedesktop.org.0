Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9169C4FA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 06:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214510E112;
	Mon, 20 Feb 2023 05:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8310E105;
 Mon, 20 Feb 2023 05:35:19 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id l26so196687qkl.0;
 Sun, 19 Feb 2023 21:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ImvMQu9MbhYZNEi7UqDr4CLOV2z/doGBwo8DN4aBBB4=;
 b=E3aguJmfL6ZHBAu5MJAf4Auyg/9HHzxQ2fvR+H4xYrSgFis1dLw2nKQ7Tn54Q/HGy0
 T1YIRlhwBP/oEGQi6zfIbn1QcsFUWDuZHnM1Z5ka3+bSBtxfUNNaZ2zKeffu4+6yJoaI
 fLMK+BRHX7R1fcWMtQq3ZGMXEHwXfjOxEoEhfA86NwxU9XRNjn+x/PpZ8Qk3iZ+gC/Gn
 ZQkRuG40HMt7aGzUTL5jPJQ0X/E2Glo5rP1GshUczSq6hveBIiiBTr7lwQsv38+vPXke
 FS1w3Wqbvo+nrIFABQG7D+yGlNC9Nb7KsfgVwBMtNn0cO5yv71c2JDsWIYAqKpS1EZK2
 MRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ImvMQu9MbhYZNEi7UqDr4CLOV2z/doGBwo8DN4aBBB4=;
 b=Awgi/MuSA799LsbTVjaztmRVldWYib5OBukS+QNyt0JrRhI378om15MOypsOZ9oVYh
 VaAMXJw1H4VwQ+mAOnT7TlxlHU7HqGg3n2dutgRhQm0I6zKtsd/Cggw0mfH0pSMTUtkL
 7fnQmpEakWAZHj4W3KuenKyWMLRyi1FPdf2zg28XHmvCiNntIGOUEFbFpGbvbwe9yYvN
 rexUuP0GMtwiB2gpBh5+7XZ2L6YYb+Mu89695KouevUsKz4e3Ta+AuBHPK9pCvlVDDIV
 kjzUpjFnFRNX+cuhxyHllatKVJdcBR9imepX8QPHIWKylk/z9ic2ps5Jiyz686z23MAw
 /0LQ==
X-Gm-Message-State: AO0yUKWlbwNc+tnld6kU1cyMN9fvJwAGBTypmV5Cglmweqm0X/fPFttf
 gT5pxVIKwmFGvNQ6vXzF/ez74Jf+LP7KJ2iN08E=
X-Google-Smtp-Source: AK7set8U69P22vzbhkFuCYvXwiQlqBF4oTHbtHzW3VxFcNN3s6MTJafrmmS91b90rbzIA2WqEiUB2UCf16ppQ5kkgsQ=
X-Received: by 2002:a37:ad10:0:b0:73b:79fb:ffb8 with SMTP id
 f16-20020a37ad10000000b0073b79fbffb8mr822199qkm.11.1676871318023; Sun, 19 Feb
 2023 21:35:18 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
 <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
 <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
 <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
 <CACO55tsGXfy9-a-nexvcn7pnDGoEWXMqhiQEBwCDkGyOeT1sXQ@mail.gmail.com>
 <dbfc1f77-29f3-7690-c231-55f906a4e7e5@googlemail.com>
 <7f6ec5b3-b5c7-f564-003e-132f112b7cf4@googlemail.com>
In-Reply-To: <7f6ec5b3-b5c7-f564-003e-132f112b7cf4@googlemail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 20 Feb 2023 15:35:06 +1000
Message-ID: <CACAvsv7Uf5=K44y8YLsiy0aMnc1zvGEQdeDe7RQF=AV+fxxzuQ@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Chris Clayton <chris2553@googlemail.com>
Content-Type: multipart/mixed; boundary="0000000000003f522505f51b0765"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003f522505f51b0765
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Feb 2023 at 04:55, Chris Clayton <chris2553@googlemail.com> wrote:
>
>
>
> On 18/02/2023 15:19, Chris Clayton wrote:
> >
> >
> > On 18/02/2023 12:25, Karol Herbst wrote:
> >> On Sat, Feb 18, 2023 at 1:22 PM Chris Clayton <chris2553@googlemail.com> wrote:
> >>>
> >>>
> >>>
> >>> On 15/02/2023 11:09, Karol Herbst wrote:
> >>>> On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
> >>>> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>
> >>>>> On 13.02.23 10:14, Chris Clayton wrote:
> >>>>>> On 13/02/2023 02:57, Dave Airlie wrote:
> >>>>>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>>>>>>>> On 10.02.23 20:01, Karol Herbst wrote:
> >>>>>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
> >>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
> >>>>>>>>>>>
> >>>>>>>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
> >>>>>>>>>>> time to fix it and there is one thing I wonder:
> >>>>>>>>>>>
> >>>>>>>>>>> Did any of the nouveau developers look at the netconsole captures Chris
> >>>>>>>>>>> posted more than a week ago to check if they somehow help to track down
> >>>>>>>>>>> the root of this problem?
> >>>>>>>>>>
> >>>>>>>>>> I did now and I can't spot anything. I think at this point it would
> >>>>>>>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
> >>>>>>>>>> any is in a weird state preventing the machine from shutting down.
> >>>>>>>>>
> >>>>>>>>> Many thx for looking into it!
> >>>>>>>>
> >>>>>>>> Yes, thanks Karol.
> >>>>>>>>
> >>>>>>>> Attached is the output from dmesg when this block of code:
> >>>>>>>>
> >>>>>>>>         /bin/mount /dev/sda7 /mnt/sda7
> >>>>>>>>         /bin/mountpoint /proc || /bin/mount /proc
> >>>>>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
> >>>>>>>>         /bin/echo t > /proc/sysrq-trigger
> >>>>>>>>         /bin/sleep 1
> >>>>>>>>         /bin/sync
> >>>>>>>>         /bin/sleep 1
> >>>>>>>>         kill $(pidof dmesg)
> >>>>>>>>         /bin/umount /mnt/sda7
> >>>>>>>>
> >>>>>>>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
> >>>>>>>>
> >>>>>>>> I hope this is what you were looking for, but if not, please let me know what you need
> >>>>>>
> >>>>>> Thanks Dave. [...]
> >>>>> FWIW, in case anyone strands here in the archives: the msg was
> >>>>> truncated. The full post can be found in a new thread:
> >>>>>
> >>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
> >>>>>
> >>>>> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
> >>>>> my laptop." didn't bring us much further to a solution. :-/ I don't
> >>>>> really like it, but for regression tracking I'm now putting this on the
> >>>>> back-burner, as a fix is not in sight.
> >>>>>
> >>>>> #regzbot monitor:
> >>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
> >>>>> #regzbot backburner: hard to debug and apparently rare
> >>>>> #regzbot ignore-activity
> >>>>>
> >>>>
> >>>> yeah.. this bug looks a little annoying. Sadly the only Turing based
> >>>> laptop I got doesn't work on Nouveau because of firmware related
> >>>> issues and we probably need to get updated ones from Nvidia here :(
> >>>>
> >>>> But it's a bit weird that the kernel doesn't shutdown, because I don't
> >>>> see anything in the logs which would prevent that from happening.
> >>>> Unless it's waiting on one of the tasks to complete, but none of them
> >>>> looked in any way nouveau related.
> >>>>
> >>>> If somebody else has any fancy kernel debugging tips here to figure
> >>>> out why it hangs, that would be very helpful...
> >>>>
> >>>
> >>> I think I've figured this out. It's to do with how my system is configured. I do have an initrd, but the only thing on
> >>> it is the cpu microcode which, it is recommended, should be loaded early. The absence of the NVidia firmare from an
> >>> initrd doesn't matter because the drivers for the hardware that need to load firmware are all built as modules, So, by
> >>> the time the devices are configured via udev, the root partition is mounted and the drivers can get at the firmware.
> >>>
> >>> I've found, by turning on nouveau debug and taking a video of the screen as the system shuts down, that nouveau seems to
> >>> be trying to run the scrubber very very late in the shutdown process. The problem is that by this time, I think the root
> >>> partition, and thus the scrubber binary, have become inaccessible.
> >>>
> >>> I seem to have two choices - either make the firmware accessible on an initrd or unload the module in a shutdown script
> >>> before the scrubber binary becomes inaccessible. The latter of these is the workaround I have implemented whilst the
> >>> problem I reported has been under investigation. For simplicity, I think I'll promote my workaround to being the
> >>> permanent solution.
> >>>
> >>> So, apologies (and thanks) to everyone whose time I have taken up with this non-bug.
> >>>
> >>
> >> Well.. nouveau shouldn't prevent the system from shutting down if the
> >> firmware file isn't available. Or at least it should print a
> >> warning/error. Mind messing with the code a little to see if skipping
> >> it kind of works? I probably can also come up with a patch by next
> >> week.
> >>
> > Well, I'd love to but a quick glance at the code caused me to bump into this obscenity:
> >
> > int
> > gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *falcon)
> > {
> >         nvkm_falcon_mask(falcon, 0x040, 0x00000000, 0x00000000);
> >
> >         if (nvkm_msec(falcon->owner->device, 10,
> >                 if (!(nvkm_falcon_rd32(falcon, 0x10c) & 0x00000006))
> >                         break;
> >         ) < 0)
> >                 return -ETIMEDOUT;
> >
> >         return 0;
> > }
> >
> > nvkm_msec is #defined to nvkm_usec which in turn is #defined to nvkm_nsec where the loop that the break is related to
> > appears
>
> I think someone who knows the code needs to look at this. What I can confirm is that after a freeze, I waited for 90
> seconds for a timeout to occur, but it didn't.
Hey,

Are you able to try the attached patch for me please?

Thanks,
Ben.

>
>
> .> Chris
> >>>
> >>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >>>>> --
> >>>>> Everything you wanna know about Linux kernel regression tracking:
> >>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>> That page also explains what to do if mails like this annoy you.
> >>>>>
> >>>>> #regzbot ignore-activity
> >>>>>
> >>>>
> >>>
> >>

--0000000000003f522505f51b0765
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-nouveau-fb-gp102-cache-scrubber-binary-on-first-.patch"
Content-Disposition: attachment; 
	filename="0001-drm-nouveau-fb-gp102-cache-scrubber-binary-on-first-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lecdul8h0>
X-Attachment-Id: f_lecdul8h0

RnJvbSA5MzFhY2U1MjlhNzNkM2IxNDI3YjM2NmE3MDYzNWRlOWFiM2FkZjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IE1vbiwgMjAgRmViIDIwMjMgMTQ6Mzk6MjEgKzEwMDAKU3ViamVjdDogW1BBVENIXSBkcm0vbm91
dmVhdS9mYi9ncDEwMi06IGNhY2hlIHNjcnViYmVyIGJpbmFyeSBvbiBmaXJzdCBsb2FkCgpTaWdu
ZWQtb2ZmLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogLi4uL2dwdS9k
cm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2ZiLmggIHwgIDMgKy0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL2Jhc2UuYyB8ICA4ICsrKy0KIC4uLi9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ2ExMDAuYyAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZiL2dhMTAyLmMgICAgfCAyMSArKysrLS0tLS0tCiAuLi4vZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL2dwMTAyLmMgICAgfCA0MSArKysrKysrLS0tLS0t
LS0tLS0tCiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL2d2MTAwLmMgICAgfCAg
NCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvcHJpdi5oIHwgIDMg
Ky0KIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvdHUxMDIuYyAgICB8ICA0ICst
CiA4IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmIu
aCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmIuaAppbmRl
eCBjNWE0ZjQ5ZWUyMDYuLjAxYTIyYTEzYjQ1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9mYi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmIuaApAQCAtMiw2ICsyLDcgQEAKICNpZm5kZWYg
X19OVktNX0ZCX0hfXwogI2RlZmluZSBfX05WS01fRkJfSF9fCiAjaW5jbHVkZSA8Y29yZS9zdWJk
ZXYuaD4KKyNpbmNsdWRlIDxjb3JlL2ZhbGNvbi5oPgogI2luY2x1ZGUgPGNvcmUvbW0uaD4KIAog
LyogbWVtb3J5IHR5cGUvYWNjZXNzIGZsYWdzLCBkbyBub3QgbWF0Y2ggaGFyZHdhcmUgdmFsdWVz
ICovCkBAIC0zMyw3ICszNCw3IEBAIHN0cnVjdCBudmttX2ZiIHsKIAljb25zdCBzdHJ1Y3QgbnZr
bV9mYl9mdW5jICpmdW5jOwogCXN0cnVjdCBudmttX3N1YmRldiBzdWJkZXY7CiAKLQlzdHJ1Y3Qg
bnZrbV9ibG9iIHZwcl9zY3J1YmJlcjsKKwlzdHJ1Y3QgbnZrbV9mYWxjb25fZncgdnByX3NjcnVi
YmVyOwogCiAJc3RydWN0IHsKIAkJc3RydWN0IHBhZ2UgKmZsdXNoX3BhZ2U7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9iYXNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9iYXNlLmMKaW5kZXggYmFjN2RjYzRjMmMx
Li4wOTU1MzQwY2M0MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2ZiL2Jhc2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9mYi9iYXNlLmMKQEAgLTE0Myw2ICsxNDMsMTAgQEAgbnZrbV9mYl9tZW1fdW5sb2NrKHN0cnVj
dCBudmttX2ZiICpmYikKIAlpZiAoIWZiLT5mdW5jLT52cHIuc2NydWJfcmVxdWlyZWQpCiAJCXJl
dHVybiAwOwogCisJcmV0ID0gbnZrbV9zdWJkZXZfb25laW5pdChzdWJkZXYpOworCWlmIChyZXQp
CisJCXJldHVybiByZXQ7CisKIAlpZiAoIWZiLT5mdW5jLT52cHIuc2NydWJfcmVxdWlyZWQoZmIp
KSB7CiAJCW52a21fZGVidWcoc3ViZGV2LCAiVlBSIG5vdCBsb2NrZWRcbiIpOwogCQlyZXR1cm4g
MDsKQEAgLTE1MCw3ICsxNTQsNyBAQCBudmttX2ZiX21lbV91bmxvY2soc3RydWN0IG52a21fZmIg
KmZiKQogCiAJbnZrbV9kZWJ1ZyhzdWJkZXYsICJWUFIgbG9ja2VkLCBydW5uaW5nIHNjcnViYmVy
IGJpbmFyeVxuIik7CiAKLQlpZiAoIWZiLT52cHJfc2NydWJiZXIuc2l6ZSkgeworCWlmICghZmIt
PnZwcl9zY3J1YmJlci5mdy5pbWcpIHsKIAkJbnZrbV93YXJuKHN1YmRldiwgIlZQUiBsb2NrZWQs
IGJ1dCBubyBzY3J1YmJlciBiaW5hcnkhXG4iKTsKIAkJcmV0dXJuIDA7CiAJfQpAQCAtMjI5LDcg
KzIzMyw3IEBAIG52a21fZmJfZHRvcihzdHJ1Y3QgbnZrbV9zdWJkZXYgKnN1YmRldikKIAogCW52
a21fcmFtX2RlbCgmZmItPnJhbSk7CiAKLQludmttX2Jsb2JfZHRvcigmZmItPnZwcl9zY3J1YmJl
cik7CisJbnZrbV9mYWxjb25fZndfZHRvcigmZmItPnZwcl9zY3J1YmJlcik7CiAKIAlpZiAoZmIt
PnN5c21lbS5mbHVzaF9wYWdlKSB7CiAJCWRtYV91bm1hcF9wYWdlKHN1YmRldi0+ZGV2aWNlLT5k
ZXYsIGZiLT5zeXNtZW0uZmx1c2hfcGFnZV9hZGRyLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ2ExMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2ZiL2dhMTAwLmMKaW5kZXggNTA5OGYyMTllM2U2Li5hNzQ1NmU3ODY0
NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL2dh
MTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ2ExMDAu
YwpAQCAtMzcsNSArMzcsNSBAQCBnYTEwMF9mYiA9IHsKIGludAogZ2ExMDBfZmJfbmV3KHN0cnVj
dCBudmttX2RldmljZSAqZGV2aWNlLCBlbnVtIG52a21fc3ViZGV2X3R5cGUgdHlwZSwgaW50IGlu
c3QsIHN0cnVjdCBudmttX2ZiICoqcGZiKQogewotCXJldHVybiBncDEwMl9mYl9uZXdfKCZnYTEw
MF9mYiwgZGV2aWNlLCB0eXBlLCBpbnN0LCBwZmIpOworCXJldHVybiBnZjEwMF9mYl9uZXdfKCZn
YTEwMF9mYiwgZGV2aWNlLCB0eXBlLCBpbnN0LCBwZmIpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ2ExMDIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL2dhMTAyLmMKaW5kZXggNWEyMWIwYWU0NTk1Li5kZDQ3
NmUwNzlmZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L2ZiL2dhMTAyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIv
Z2ExMDIuYwpAQCAtMjUsMjUgKzI1LDIwIEBACiAjaW5jbHVkZSA8ZW5naW5lL252ZGVjLmg+CiAK
IHN0YXRpYyBpbnQKLWdhMTAyX2ZiX3Zwcl9zY3J1YihzdHJ1Y3QgbnZrbV9mYiAqZmIpCitnYTEw
Ml9mYl9vbmVpbml0KHN0cnVjdCBudmttX2ZiICpmYikKIHsKLQlzdHJ1Y3QgbnZrbV9mYWxjb25f
ZncgZncgPSB7fTsKLQlpbnQgcmV0OworCXN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2ID0gJmZi
LT5zdWJkZXY7CiAKLQlyZXQgPSBudmttX2ZhbGNvbl9md19jdG9yX2hzX3YyKCZnYTEwMl9mbGNu
X2Z3LCAibWVtLXVubG9jayIsICZmYi0+c3ViZGV2LCAibnZkZWMvc2NydWJiZXIiLAotCQkJCQkw
LCAmZmItPnN1YmRldi5kZXZpY2UtPm52ZGVjWzBdLT5mYWxjb24sICZmdyk7Ci0JaWYgKHJldCkK
LQkJcmV0dXJuIHJldDsKKwludmttX2ZhbGNvbl9md19jdG9yX2hzX3YyKCZnYTEwMl9mbGNuX2Z3
LCAibWVtLXVubG9jayIsIHN1YmRldiwgIm52ZGVjL3NjcnViYmVyIiwKKwkJCQkgIDAsICZzdWJk
ZXYtPmRldmljZS0+bnZkZWNbMF0tPmZhbGNvbiwgJmZiLT52cHJfc2NydWJiZXIpOwogCi0JcmV0
ID0gbnZrbV9mYWxjb25fZndfYm9vdCgmZncsICZmYi0+c3ViZGV2LCB0cnVlLCBOVUxMLCBOVUxM
LCAwLCAwKTsKLQludmttX2ZhbGNvbl9md19kdG9yKCZmdyk7Ci0JcmV0dXJuIHJldDsKKwlyZXR1
cm4gZ2YxMDBfZmJfb25laW5pdChmYik7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbnZrbV9m
Yl9mdW5jCiBnYTEwMl9mYiA9IHsKIAkuZHRvciA9IGdmMTAwX2ZiX2R0b3IsCi0JLm9uZWluaXQg
PSBnZjEwMF9mYl9vbmVpbml0LAorCS5vbmVpbml0ID0gZ2ExMDJfZmJfb25laW5pdCwKIAkuaW5p
dCA9IGdtMjAwX2ZiX2luaXQsCiAJLmluaXRfcGFnZSA9IGd2MTAwX2ZiX2luaXRfcGFnZSwKIAku
aW5pdF91bmtuID0gZ3AxMDBfZmJfaW5pdF91bmtuLApAQCAtNTEsMTMgKzQ2LDEzIEBAIGdhMTAy
X2ZiID0gewogCS5yYW1fbmV3ID0gZ2ExMDJfcmFtX25ldywKIAkuZGVmYXVsdF9iaWdwYWdlID0g
MTYsCiAJLnZwci5zY3J1Yl9yZXF1aXJlZCA9IHR1MTAyX2ZiX3Zwcl9zY3J1Yl9yZXF1aXJlZCwK
LQkudnByLnNjcnViID0gZ2ExMDJfZmJfdnByX3NjcnViLAorCS52cHIuc2NydWIgPSBncDEwMl9m
Yl92cHJfc2NydWIsCiB9OwogCiBpbnQKIGdhMTAyX2ZiX25ldyhzdHJ1Y3QgbnZrbV9kZXZpY2Ug
KmRldmljZSwgZW51bSBudmttX3N1YmRldl90eXBlIHR5cGUsIGludCBpbnN0LCBzdHJ1Y3QgbnZr
bV9mYiAqKnBmYikKIHsKLQlyZXR1cm4gZ3AxMDJfZmJfbmV3XygmZ2ExMDJfZmIsIGRldmljZSwg
dHlwZSwgaW5zdCwgcGZiKTsKKwlyZXR1cm4gZ2YxMDBfZmJfbmV3XygmZ2ExMDJfZmIsIGRldmlj
ZSwgdHlwZSwgaW5zdCwgcGZiKTsKIH0KIAogTU9EVUxFX0ZJUk1XQVJFKCJudmlkaWEvZ2ExMDIv
bnZkZWMvc2NydWJiZXIuYmluIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9mYi9ncDEwMi5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvZmIvZ3AxMDIuYwppbmRleCAyNjU4NDgxZDU3NWIuLjE0ZDk0MmU4Yjg1NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ3AxMDIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9ncDEwMi5jCkBAIC0yOSwx
OCArMjksNyBAQAogaW50CiBncDEwMl9mYl92cHJfc2NydWIoc3RydWN0IG52a21fZmIgKmZiKQog
ewotCXN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2ID0gJmZiLT5zdWJkZXY7Ci0Jc3RydWN0IG52
a21fZmFsY29uX2Z3IGZ3ID0ge307Ci0JaW50IHJldDsKLQotCXJldCA9IG52a21fZmFsY29uX2Z3
X2N0b3JfaHMoJmdtMjAwX2ZsY25fZncsICJtZW0tdW5sb2NrIiwgc3ViZGV2LCBOVUxMLAotCQkJ
CSAgICAgIm52ZGVjL3NjcnViYmVyIiwgMCwgJnN1YmRldi0+ZGV2aWNlLT5udmRlY1swXS0+ZmFs
Y29uLCAmZncpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KLQlyZXQgPSBudmttX2ZhbGNv
bl9md19ib290KCZmdywgc3ViZGV2LCB0cnVlLCBOVUxMLCBOVUxMLCAwLCAweDAwMDAwMDAwKTsK
LQludmttX2ZhbGNvbl9md19kdG9yKCZmdyk7Ci0JcmV0dXJuIHJldDsKKwlyZXR1cm4gbnZrbV9m
YWxjb25fZndfYm9vdCgmZmItPnZwcl9zY3J1YmJlciwgJmZiLT5zdWJkZXYsIHRydWUsIE5VTEws
IE5VTEwsIDAsIDB4MDAwMDAwMDApOwogfQogCiBib29sCkBAIC01MSwxMCArNDAsMjEgQEAgZ3Ax
MDJfZmJfdnByX3NjcnViX3JlcXVpcmVkKHN0cnVjdCBudmttX2ZiICpmYikKIAlyZXR1cm4gKG52
a21fcmQzMihkZXZpY2UsIDB4MTAwY2QwKSAmIDB4MDAwMDAwMTApICE9IDA7CiB9CiAKK2ludAor
Z3AxMDJfZmJfb25laW5pdChzdHJ1Y3QgbnZrbV9mYiAqZmIpCit7CisJc3RydWN0IG52a21fc3Vi
ZGV2ICpzdWJkZXYgPSAmZmItPnN1YmRldjsKKworCW52a21fZmFsY29uX2Z3X2N0b3JfaHMoJmdt
MjAwX2ZsY25fZncsICJtZW0tdW5sb2NrIiwgc3ViZGV2LCBOVUxMLCAibnZkZWMvc2NydWJiZXIi
LAorCQkJICAgICAgIDAsICZzdWJkZXYtPmRldmljZS0+bnZkZWNbMF0tPmZhbGNvbiwgJmZiLT52
cHJfc2NydWJiZXIpOworCisJcmV0dXJuIGdmMTAwX2ZiX29uZWluaXQoZmIpOworfQorCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG52a21fZmJfZnVuYwogZ3AxMDJfZmIgPSB7CiAJLmR0b3IgPSBnZjEw
MF9mYl9kdG9yLAotCS5vbmVpbml0ID0gZ2YxMDBfZmJfb25laW5pdCwKKwkub25laW5pdCA9IGdw
MTAyX2ZiX29uZWluaXQsCiAJLmluaXQgPSBnbTIwMF9mYl9pbml0LAogCS5pbml0X3JlbWFwcGVy
ID0gZ3AxMDBfZmJfaW5pdF9yZW1hcHBlciwKIAkuaW5pdF9wYWdlID0gZ20yMDBfZmJfaW5pdF9w
YWdlLApAQCAtNjQsMjMgKzY0LDEwIEBAIGdwMTAyX2ZiID0gewogCS5yYW1fbmV3ID0gZ3AxMDBf
cmFtX25ldywKIH07CiAKLWludAotZ3AxMDJfZmJfbmV3Xyhjb25zdCBzdHJ1Y3QgbnZrbV9mYl9m
dW5jICpmdW5jLCBzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSwKLQkgICAgICBlbnVtIG52a21f
c3ViZGV2X3R5cGUgdHlwZSwgaW50IGluc3QsIHN0cnVjdCBudmttX2ZiICoqcGZiKQotewotCWlu
dCByZXQgPSBnZjEwMF9mYl9uZXdfKGZ1bmMsIGRldmljZSwgdHlwZSwgaW5zdCwgcGZiKTsKLQlp
ZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0JbnZrbV9maXJtd2FyZV9sb2FkX2Jsb2IoJigqcGZi
KS0+c3ViZGV2LCAibnZkZWMvc2NydWJiZXIiLCAiIiwgMCwKLQkJCQkmKCpwZmIpLT52cHJfc2Ny
dWJiZXIpOwotCXJldHVybiAwOwotfQotCiBpbnQKIGdwMTAyX2ZiX25ldyhzdHJ1Y3QgbnZrbV9k
ZXZpY2UgKmRldmljZSwgZW51bSBudmttX3N1YmRldl90eXBlIHR5cGUsIGludCBpbnN0LCBzdHJ1
Y3QgbnZrbV9mYiAqKnBmYikKIHsKLQlyZXR1cm4gZ3AxMDJfZmJfbmV3XygmZ3AxMDJfZmIsIGRl
dmljZSwgdHlwZSwgaW5zdCwgcGZiKTsKKwlyZXR1cm4gZ2YxMDBfZmJfbmV3XygmZ3AxMDJfZmIs
IGRldmljZSwgdHlwZSwgaW5zdCwgcGZiKTsKIH0KIAogTU9EVUxFX0ZJUk1XQVJFKCJudmlkaWEv
Z3AxMDIvbnZkZWMvc2NydWJiZXIuYmluIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9mYi9ndjEwMC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvZmIvZ3YxMDAuYwppbmRleCAwZTNjMGE4ZjVkNzEuLjRkOGEyODZhN2EzNCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvZ3YxMDAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9ndjEwMC5jCkBA
IC0zMSw3ICszMSw3IEBAIGd2MTAwX2ZiX2luaXRfcGFnZShzdHJ1Y3QgbnZrbV9mYiAqZmIpCiBz
dGF0aWMgY29uc3Qgc3RydWN0IG52a21fZmJfZnVuYwogZ3YxMDBfZmIgPSB7CiAJLmR0b3IgPSBn
ZjEwMF9mYl9kdG9yLAotCS5vbmVpbml0ID0gZ2YxMDBfZmJfb25laW5pdCwKKwkub25laW5pdCA9
IGdwMTAyX2ZiX29uZWluaXQsCiAJLmluaXQgPSBnbTIwMF9mYl9pbml0LAogCS5pbml0X3BhZ2Ug
PSBndjEwMF9mYl9pbml0X3BhZ2UsCiAJLmluaXRfdW5rbiA9IGdwMTAwX2ZiX2luaXRfdW5rbiwK
QEAgLTQ1LDcgKzQ1LDcgQEAgZ3YxMDBfZmIgPSB7CiBpbnQKIGd2MTAwX2ZiX25ldyhzdHJ1Y3Qg
bnZrbV9kZXZpY2UgKmRldmljZSwgZW51bSBudmttX3N1YmRldl90eXBlIHR5cGUsIGludCBpbnN0
LCBzdHJ1Y3QgbnZrbV9mYiAqKnBmYikKIHsKLQlyZXR1cm4gZ3AxMDJfZmJfbmV3XygmZ3YxMDBf
ZmIsIGRldmljZSwgdHlwZSwgaW5zdCwgcGZiKTsKKwlyZXR1cm4gZ2YxMDBfZmJfbmV3XygmZ3Yx
MDBfZmIsIGRldmljZSwgdHlwZSwgaW5zdCwgcGZiKTsKIH0KIAogTU9EVUxFX0ZJUk1XQVJFKCJu
dmlkaWEvZ3YxMDAvbnZkZWMvc2NydWJiZXIuYmluIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9mYi9wcml2LmgKaW5kZXggZjUxNzc1MWY5NGFjLi43MjZjMzBjOGJm
OTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3By
aXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9wcml2LmgK
QEAgLTgzLDggKzgzLDcgQEAgaW50IGdtMjAwX2ZiX2luaXRfcGFnZShzdHJ1Y3QgbnZrbV9mYiAq
KTsKIHZvaWQgZ3AxMDBfZmJfaW5pdF9yZW1hcHBlcihzdHJ1Y3QgbnZrbV9mYiAqKTsKIHZvaWQg
Z3AxMDBfZmJfaW5pdF91bmtuKHN0cnVjdCBudmttX2ZiICopOwogCi1pbnQgZ3AxMDJfZmJfbmV3
Xyhjb25zdCBzdHJ1Y3QgbnZrbV9mYl9mdW5jICosIHN0cnVjdCBudmttX2RldmljZSAqLCBlbnVt
IG52a21fc3ViZGV2X3R5cGUsIGludCwKLQkJICBzdHJ1Y3QgbnZrbV9mYiAqKik7CitpbnQgZ3Ax
MDJfZmJfb25laW5pdChzdHJ1Y3QgbnZrbV9mYiAqKTsKIGJvb2wgZ3AxMDJfZmJfdnByX3NjcnVi
X3JlcXVpcmVkKHN0cnVjdCBudmttX2ZiICopOwogaW50IGdwMTAyX2ZiX3Zwcl9zY3J1YihzdHJ1
Y3QgbnZrbV9mYiAqKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZmIvdHUxMDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L2ZiL3R1MTAyLmMKaW5kZXggYmU4MmFmMDM2NGVlLi5iODgwM2MxMjRjM2IgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3R1MTAyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvdHUxMDIuYwpAQCAtMzEsNyArMzEs
NyBAQCB0dTEwMl9mYl92cHJfc2NydWJfcmVxdWlyZWQoc3RydWN0IG52a21fZmIgKmZiKQogc3Rh
dGljIGNvbnN0IHN0cnVjdCBudmttX2ZiX2Z1bmMKIHR1MTAyX2ZiID0gewogCS5kdG9yID0gZ2Yx
MDBfZmJfZHRvciwKLQkub25laW5pdCA9IGdmMTAwX2ZiX29uZWluaXQsCisJLm9uZWluaXQgPSBn
cDEwMl9mYl9vbmVpbml0LAogCS5pbml0ID0gZ20yMDBfZmJfaW5pdCwKIAkuaW5pdF9wYWdlID0g
Z3YxMDBfZmJfaW5pdF9wYWdlLAogCS5pbml0X3Vua24gPSBncDEwMF9mYl9pbml0X3Vua24sCkBA
IC00NSw3ICs0NSw3IEBAIHR1MTAyX2ZiID0gewogaW50CiB0dTEwMl9mYl9uZXcoc3RydWN0IG52
a21fZGV2aWNlICpkZXZpY2UsIGVudW0gbnZrbV9zdWJkZXZfdHlwZSB0eXBlLCBpbnQgaW5zdCwg
c3RydWN0IG52a21fZmIgKipwZmIpCiB7Ci0JcmV0dXJuIGdwMTAyX2ZiX25ld18oJnR1MTAyX2Zi
LCBkZXZpY2UsIHR5cGUsIGluc3QsIHBmYik7CisJcmV0dXJuIGdmMTAwX2ZiX25ld18oJnR1MTAy
X2ZiLCBkZXZpY2UsIHR5cGUsIGluc3QsIHBmYik7CiB9CiAKIE1PRFVMRV9GSVJNV0FSRSgibnZp
ZGlhL3R1MTAyL252ZGVjL3NjcnViYmVyLmJpbiIpOwotLSAKMi4zNS4xCgo=
--0000000000003f522505f51b0765--
