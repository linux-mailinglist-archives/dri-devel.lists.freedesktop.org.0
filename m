Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC0380FB2
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFC96F3F6;
	Fri, 14 May 2021 18:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296626F3F6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:23:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id p20so14936540ljj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbsFzf/6uE8/vghKo6cKrHWCyJcOabDGOcn6Hrn7dcI=;
 b=DCYZozQrMzknue6/EWuFmrYFlWMetVMt8Dmq65ypZNXDxu9hQw677RZsR4yZkbfMQ4
 Y6pwoY9/eto3ToMEMFwHALm0FAO4vO38F5ORdjb5yDrn1Zh541QjFzH+HhSGLWO0Oa12
 i7jcZ6xtUujNIIebz2U6mVmVFv84z0I3tn664=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbsFzf/6uE8/vghKo6cKrHWCyJcOabDGOcn6Hrn7dcI=;
 b=m+Dgwbp3iUgUumKX6mgBQPbULQh/p4jvw32rJx/C1dDf6OtTn+dAAflNVHH7tO/DIY
 Q9YohVXA0uBOcTHhRLwRwszjVwDGSDvLG5KO6/tMBjDtCkzPvLNa6Tpwrl3C5Dib/BsV
 8knvw5W6BwfHVKdIlTAgw/R/eYlLA5tFmIh+54PL0jAzpOhH/zlhasmJxNc6N9upe46F
 PMKj2UfEw8CdmDkYiGCWRlHOgFVPumHvvVfopJgQvYdAwEZ7yOClTePUAIBQrGQM3iyq
 yc/OmRPtfKRw5lh0E8lPQ6I4hduPvkF6grjOmax/iD0Hb8eXebwJfbBL+eEc9yx+XfRi
 gqBA==
X-Gm-Message-State: AOAM530lqYReodOc8Ja4VdLjug3sdPjS8MC9R/MQtkjdNbDWIzHDIc5b
 yLgPW1Sp8FSGjsb2JmAnjvgqRo2SN7zaVsnTGqU=
X-Google-Smtp-Source: ABdhPJyWjyEPSYA+xIU59a95hxQS7BzvxfLVwGnWIC98fb6YpkWVW3ZYHrJgDdezKYIi3l8WwtOJPA==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr17097340lji.341.1621016626352; 
 Fri, 14 May 2021 11:23:46 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id q5sm874758lfm.55.2021.05.14.11.23.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 11:23:45 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id h10so3753560lfm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:23:45 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr32461268lfs.377.1621016624959; 
 Fri, 14 May 2021 11:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <CAHk-=whN=zrJ8BOLaGsJDH8d3sXLEoXA2DVsCq40OAUc1npOOw@mail.gmail.com>
In-Reply-To: <CAHk-=whN=zrJ8BOLaGsJDH8d3sXLEoXA2DVsCq40OAUc1npOOw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 11:23:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=winm7rEueQ2moqMZWWNNywu_9eVUrT7g0a30C8fhJojTQ@mail.gmail.com>
Message-ID: <CAHk-=winm7rEueQ2moqMZWWNNywu_9eVUrT7g0a30C8fhJojTQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: multipart/mixed; boundary="0000000000001b409405c24e5891"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001b409405c24e5891
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 10:37 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> IOW, something like this would seem fairly simple and straightforward:

Proper patch in case syzbot can test this..

                  Linus

--0000000000001b409405c24e5891
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-vt-don-t-allow-text-mode-resizing-when-in-KD_GRAPHIC.patch"
Content-Disposition: attachment; 
	filename="0001-vt-don-t-allow-text-mode-resizing-when-in-KD_GRAPHIC.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_koon84w90>
X-Attachment-Id: f_koon84w90

RnJvbSBiMzNjYTE5NWNlY2VhNDc4NzY4ZGUzNTNiM2FlOTc2YzA3YTY1NjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IEZyaSwgMTQgTWF5IDIwMjEgMTE6MDY6MTIgLTA3MDAKU3ViamVjdDog
W1BBVENIXSB2dDogZG9uJ3QgYWxsb3cgdGV4dC1tb2RlIHJlc2l6aW5nIHdoZW4gaW4gS0RfR1JB
UEhJQ1MgbW9kZQoKVGhlIFZUIGxheWVyIGl0c2VsZiBqdXN0IGtlZXBzIHRyYWNrIG9mIHRoZSB1
bmRlcmx5aW5nIHRleHQgY29udGVudHMKanVzdCBmaW5lLCBidXQgaWYgdGhlIHVuZGVybHlpbmcg
aGFyZHdhcmUgZHJpdmVyIGhhcyBhIGNvbl9yZXNpemUoKQpmdW5jdGlvbiwgd2UgY2FuJ3QganVz
dCBpZ25vcmUgaXQgd2hlbiBpbiBLRF9HUkFQSElDUyBtb2RlLgoKU28ganVzdCByZWZ1c2UgdG8g
ZG8gYSB0ZXh0IG1vZGUgcmVzaXplIGlmIHdlJ3JlIG5vdCBpbiB0ZXh0IG1vZGUuCgpSZXBvcnRl
ZC1ieTogVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpwPgpS
ZXBvcnRlZC1ieTogc3l6Ym90IDxzeXpib3QrMWYyOWUxMjZjZjQ2MWM0ZGUzYjNAc3l6a2FsbGVy
LmFwcHNwb3RtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvdHR5L3Z0L3Z0LmMgfCA3ICsrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3R0eS92dC92dC5jIGIvZHJpdmVycy90dHkvdnQvdnQuYwppbmRleCAw
MTY0NWU4N2IzZDUuLmYyNGU2MjdiNzQwMiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvdnQvdnQu
YworKysgYi9kcml2ZXJzL3R0eS92dC92dC5jCkBAIC0xMTcxLDggKzExNzEsMTMgQEAgc3RhdGlj
IGlubGluZSBpbnQgcmVzaXplX3NjcmVlbihzdHJ1Y3QgdmNfZGF0YSAqdmMsIGludCB3aWR0aCwg
aW50IGhlaWdodCwKIAkvKiBSZXNpemVzIHRoZSByZXNvbHV0aW9uIG9mIHRoZSBkaXNwbGF5IGFk
YXBhdGVyICovCiAJaW50IGVyciA9IDA7CiAKLQlpZiAodmMtPnZjX21vZGUgIT0gS0RfR1JBUEhJ
Q1MgJiYgdmMtPnZjX3N3LT5jb25fcmVzaXplKQorCWlmICh2Yy0+dmNfc3ctPmNvbl9yZXNpemUp
IHsKKwkJLy8gSWYgd2UgaGF2ZSBhIHJlc2l6ZSBmdW5jdGlvbiBidXQgYXJlIGluIEtEX0dSQVBI
SUNTIG1vZGUsCisJCS8vIHdlIGNhbid0IGFjdHVhbGx5IGRvIGEgcmVzaXplIGFuZCBuZWVkIHRv
IGVycm9yIG91dC4KKwkJaWYgKHZjLT52Y19tb2RlID09IEtEX0dSQVBISUNTKQorCQkJcmV0dXJu
IC1FSU5WQUw7CiAJCWVyciA9IHZjLT52Y19zdy0+Y29uX3Jlc2l6ZSh2Yywgd2lkdGgsIGhlaWdo
dCwgdXNlcik7CisJfQogCiAJcmV0dXJuIGVycjsKIH0KLS0gCjIuMzEuMS4zNjUuZ2EyYTA1YTM5
YzUKCg==
--0000000000001b409405c24e5891--
