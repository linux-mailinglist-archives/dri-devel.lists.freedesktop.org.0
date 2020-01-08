Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F6F133F4E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 11:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43786E1B2;
	Wed,  8 Jan 2020 10:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D666E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 10:31:25 +0000 (UTC)
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MryKr-1jRCW61Jxd-00nx2m for <dri-devel@lists.freedesktop.org>; Wed, 08
 Jan 2020 11:31:23 +0100
Received: by mail-qk1-f177.google.com with SMTP id a203so2162063qkc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 02:31:22 -0800 (PST)
X-Gm-Message-State: APjAAAWirSRVvWx0XB7N3DE86XgNjKfQWjrWQZSJCoJUFY1UiCqepfGL
 7UJ3p+shYkAmi8lxQRRQwwgQjKkldo/EaKmRxIk=
X-Google-Smtp-Source: APXvYqyhlwawSyTf5aVJ0Eab5k8mO35w/P4gl0bOQkiomDlqk+RzlP137GT/eokTJwASNeOCqWrTC0WxbzatGEhiYf8=
X-Received: by 2002:a37:a8d4:: with SMTP id r203mr3552221qke.394.1578479482002; 
 Wed, 08 Jan 2020 02:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20200107212747.4182515-1-arnd@arndb.de>
 <20200107220019.GC7869@pendragon.ideasonboard.com>
 <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
 <20200107221222.GE7869@pendragon.ideasonboard.com>
 <CAK8P3a0ny0UhOpvVNE3x6gE=3SG7h_sBvtR7L7Hj2XsjrkavAA@mail.gmail.com>
In-Reply-To: <CAK8P3a0ny0UhOpvVNE3x6gE=3SG7h_sBvtR7L7Hj2XsjrkavAA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 11:31:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3jAnFZA3GFRtdYdg1-i-oih3pOQzkkrK-X3BGsFrMiZQ@mail.gmail.com>
Message-ID: <CAK8P3a3jAnFZA3GFRtdYdg1-i-oih3pOQzkkrK-X3BGsFrMiZQ@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:P8zOcxFHelxZ91kmr/0UourysDtQJfZ29Z/+xJEyTS6ZnW9ZWEJ
 WpCYBxytLrK908KBl7ivuuyLdjJxznDFQeLVlcOVwXpBpWGQBRIdbqOttZynnReQpIMFPY8
 EV+hu1ZcLc/R/84Tz0P7nf9r3TKx0cP5UfQ71Be97kcY0cO6VNiQp5TiOey1nyzTd2799iy
 6L2DBWk07gSEXwRafRPdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kcPjQ1Q1/cg=:p1h4MCMkteuvBiKrRw5Gy3
 OZNsksnrNk8s5SXBGpHBEDDE6dSIJg882nXYyUTMbSYmZE8eT4a5c+GsVQU6dIApEsKR3Fi5z
 pUP/Kl6+jt0FJPGC37vT9eCq6j1rNhpnKUhShZA26NGfFXxR956oIXTtK8aG/IiZlyQSr1II4
 8sxShc8uyChWyADMzNA1+SRaXCQjHJXOe70wo41OPt8nndHH9oUVHeIVOPAWHqZ6d6CO1f6G9
 tk3P+l8KaWZHk56ItLd7JuMfsWc6Iesi8qoe+U41NtCJMZDsnKgBCSp1UsvQljtgleOSxZ+2A
 6WAC2Ho0q8pH9ira2qz+ji+9VyGzObSwjYdN1V4Gn5MFBg5KbeZ+aWardkw6vIa8t2vQwBtIP
 mIkxc+b0Cj5RtdRswCuErILDLNx1mlRI7n+aIfOFYxW0NFEknDoh5GYzGHwRD43Yy3+VE+ZzT
 NFsatNVs6tR3YYP+DNt9qiQE9s1RSPFeG59ly7Uhr3vYjtKUStCDEsx8rrdUaSI4HvPCc+2RL
 6G8UxwdzQxlhcdPQKBOJoau0zOcG/vHwXwREDjwK6v29kfqkheNs4Xk1/mLk9e245FD0i3RiC
 rwxAucJ+FDKj3uKbVsn5/7UBQJLQlMQkBK/vH0aUZcPRlfP4hi1nXPVUbNbIzAQBmN5nZ6dK3
 3vKRsYflWGCszc8LJ8YiABtSRQwBGxeP30PZQM9h4+2XbcJSP8LUYM43qp0QUs7cyoIFtLAHf
 m0AsmVrxZZQVHvjtTSZEPvPQzNkAmemmHlRvX2SWiq+pJBVdWZybZH93/nSrqsGgWv87wqUKr
 pM0NM5AXPPS5iPXVXe48RDEmwpYCbl2pDXs4y4XJIX5mC9OVXmKaAeNBXrYDPmcrdxU72t8yT
 WRQWR6l1IJU1Lsif1wVg==
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>,
 Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 11:26 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jan 7, 2020 at 11:12 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Jan 07, 2020 at 11:09:13PM +0100, Arnd Bergmann wrote:
> > > On Tue, Jan 7, 2020 at 11:00 PM Laurent Pinchart wrote:
>
> > > > Isn't this something that should be fixed at the compiler level ?
> > >
> > > I suspect but have not verified that structleak gcc plugin is partly at
> > > fault here as well, it has caused similar problems elsewhere.
>
> I checked that now, and it's indeed the structleak plugin.
>
> Interestingly the problem goes away without the -fconserve-stack
> option, which is meant to reduce the stack usage bug has the
> opposite effect here (!).
>
> I'll do some more tests tomorrow.

Here's a reduced test case:

struct list_head {
  struct list_head *next, *prev;
} typedef initcall_t;
struct sg_table {
  int sgl;
  int nents;
  int orig_nents;
};
struct spi_transfer {
  void *tx_buf;
  void *rx_buf;
  unsigned len;
  int tx_dma;
  int rx_dma;
  struct sg_table tx_sg;
  struct sg_table rx_sg;
  short delay_usecs;
  int delay;
  int cs_change_delay;
  int word_delay;
  int speed_hz;
  int effective_speed_hz;
  int ptp_sts_word_pre;
  int ptp_sts_word_post;
  int ptp_sts;
  _Bool timestamped_pre;
  struct list_head transfer_list;
};
void spi_sync_transfer(struct spi_transfer *, int);
void spi_write(void) {
  struct spi_transfer t;
  spi_sync_transfer(&t, 0);
}
int jbt_ret_write_0_err;
void jbt_ret_write_0(void) {
  if (jbt_ret_write_0_err)
    spi_write();
}
void jbt_reg_write_1(int *err) {
  if (*err) {
    struct spi_transfer t;
    spi_sync_transfer(&t, 1);
  }
}
void jbt_reg_write_2(int *err) {
  short tx_buf[3];
  if (err) {
    struct spi_transfer t = {tx_buf};
    spi_sync_transfer(&t, 0);
  }
}
int td028ttec1_prepare_i;
void td028ttec1_prepare() {
  int ret;
  for (; td028ttec1_prepare_i; ++td028ttec1_prepare_i) {
    jbt_ret_write_0();
  }
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_2(&ret);
  jbt_ret_write_0();
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
  jbt_reg_write_1(&ret);
}

$ arm-linux-gnueabi/bin/arm-linux-gnueabi-gcc panel-tpo-td028ttec1.c
-fplugin=scripts/gcc-plugins/structleak_plugin.so
-fplugin-arg-structleak_plugin-byref-all  -S -O3
-Wframe-larger-than=128
panel-tpo-td028ttec1.i: In function 'td028ttec1_prepare':
panel-tpo-td028ttec1.i:80:1: warning: the frame size of 192 bytes is
larger than 128 bytes [-Wframe-larger-than=]

$ arm-linux-gnueabi/bin/arm-linux-gnueabi-gcc panel-tpo-td028ttec1.c
-fplugin=scripts/gcc-plugins/structleak_plugin.so
-fplugin-arg-structleak_plugin-byref-all  -S -O3
-Wframe-larger-than=128 -fconserve-stack
panel-tpo-td028ttec1.i: In function 'td028ttec1_prepare':
panel-tpo-td028ttec1.i:80:1: warning: the frame size of 2032 bytes is
larger than 128 bytes [-Wframe-larger-than=]

I'm still not entirely sure what to make of this. The -fconserve-stack
is supposed
to prevent inlining when the frames get too large, but it appears that inlining
less has the opposite effect here, as it leaves larger structures on the stack
of the caller. structleak_plugin-byref-all causes each copy of the
'struct spi_transfer'
to be initialized (intentionally) and left on the stack (as a
side-effect of a somewhat
suboptimal implementation).

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
