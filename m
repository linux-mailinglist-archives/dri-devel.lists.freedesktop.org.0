Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16589437637
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BF66E5BE;
	Fri, 22 Oct 2021 11:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8576E5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 11:55:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d3so460925wrh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=ogYfRiKo2fqi2PoN6AOelWV/+QkxK0QKgf9UPhxQKZA=;
 b=cSQ+yvwF8BU2Lv1zA5s+GfGMDtVvpPlD1H2vuoP2jgpFrn9Xq0+d3t007xZrJPrzsM
 PlOajyOUBjeWhz7ImrcLnYZQmeazQrW/Zu02RodV9EAfiVNr0ru0C34mmEfp5KTw9WHS
 HnidsLO5wunVGKo2O9q5cUhvz/IWkdqQQOmZGETK4sA3t4bm7xcyTr2BBGZgBR8rYYFt
 kABah/nWxdjjc4hPcZafsHU20ndxyWDqAVx77RfkwZ1a5vccTNsRixvwG9TJvEsmc4T/
 iTT7xmVAi7Htfmu3D26FRqfZQzDr+lb37S1r4NgVngQ77sjCKe+UexjigMa3WnPH/6Hf
 PT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=ogYfRiKo2fqi2PoN6AOelWV/+QkxK0QKgf9UPhxQKZA=;
 b=fWGr4qSS01vqnLROpxQ9INjPnSAuS/EEPiVeZ63I1scsm87H8OpxmlQSGra/S7dZMq
 6KGNtq/eNzhAwxR0gdIEjtd4BA9UvHYp8ix8ksnKMvxn+h5tBjEPLdzlJCssfMNTxN1K
 wJflx49i0fF9GR3pdHiRwpRsD2O1jlogU7HfGPA3vScLv+KRMsVbq+DtEKL5cNxewjpV
 1tlekw12x9A+evhRU5/9gprEPn+Mrxid+DVuOaBAaRZ61fVcCJUmAjjy6Xs0AFC8LeMF
 83mbx0hoXmo1Ql7w1tsww4f97TLF3Dzzn6r4aEdDNG0N9FNFP0vmsAQ0s/kQCf64Rkul
 9qlg==
X-Gm-Message-State: AOAM530WmQWRuwGcV3dwuhnJp1vwpjGgbqVN7t+JbMjzt3tyJbZmLXCu
 gXKV2Jf2b7GPv4s1cXJiiQJ+4/cayp8=
X-Google-Smtp-Source: ABdhPJzUKYrUuuCwSkE5Ppb9Io2PZ15FObu+N3GHByWYPMIhoSj51pUYymKMnCFNgTkmsrTsNU7F6w==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr15426310wrs.365.1634903744167; 
 Fri, 22 Oct 2021 04:55:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a39f:d981:e7cb:e6dc?
 ([2a02:908:1252:fb60:a39f:d981:e7cb:e6dc])
 by smtp.gmail.com with ESMTPSA id t11sm7550143wrz.65.2021.10.22.04.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 04:55:43 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix kerneldoc for renamed members
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20211021141945.84023-1-christian.koenig@amd.com>
 <CADnq5_N3N=RPzRPDB1aG1btmHOMqdRRce28YuuvEJc25Hw6Dcw@mail.gmail.com>
 <CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4c468a08-1b56-2f0a-7258-8fdac7582212@gmail.com>
Date: Fri, 22 Oct 2021 13:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------68004966166E5D1B914805E0"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------68004966166E5D1B914805E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 21.10.21 um 18:24 schrieb Sumit Semwal:
> Hi Christian,
>
> On Thu, 21 Oct 2021 at 19:55, Alex Deucher <alexdeucher@gmail.com 
> <mailto:alexdeucher@gmail.com>> wrote:
>
>     On Thu, Oct 21, 2021 at 10:19 AM Christian König
>     <ckoenig.leichtzumerken@gmail.com
>     <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>     >
>     > Those members where renamed, update the kerneldoc as well.
>     >
>     > Signed-off-by: Christian König <christian.koenig@amd.com
>     <mailto:christian.koenig@amd.com>>
>
>     Reviewed-by: Alex Deucher <alexander.deucher@amd.com
>     <mailto:alexander.deucher@amd.com>>
>
> LGTM, but perhaps you want to send it from your amd.com 
> <http://amd.com> account?

Always using my gmail account instead because the AMD servers are only 
accessible through VPN.

> Acked-by: Sumit Semwal <sumit.semwal@linaro.org 
> <mailto:sumit.semwal@linaro.org>>

Thanks,
Christian.

>
>     > ---
>     >  include/linux/dma-buf.h | 4 ++--
>     >  1 file changed, 2 insertions(+), 2 deletions(-)
>     >
>     > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>     > index 02c2eb874da6..9807aef33685 100644
>     > --- a/include/linux/dma-buf.h
>     > +++ b/include/linux/dma-buf.h
>     > @@ -433,8 +433,8 @@ struct dma_buf {
>     >         /** @poll: for userspace poll support */
>     >         wait_queue_head_t poll;
>     >
>     > -       /** @cb_excl: for userspace poll support */
>     > -       /** @cb_shared: for userspace poll support */
>     > +       /** @cb_in: for userspace poll support */
>     > +       /** @cb_out: for userspace poll support */
>     >         struct dma_buf_poll_cb_t {
>     >                 struct dma_fence_cb cb;
>     >                 wait_queue_head_t *poll;
>     > --
>     > 2.25.1
>     >
>
>
> Best,
> Sumit.
>
> -- 
> Thanks and regards,
>
> Sumit Semwal (he / him)
> Tech Lead - LCG, Vertical Technologies
> Linaro.org │ Open source software for ARM SoCs


--------------68004966166E5D1B914805E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 21.10.21 um 18:24 schrieb Sumit Semwal:<br>
    <blockquote type="cite"
cite="mid:CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi Christian,</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, 21 Oct 2021 at
            19:55, Alex Deucher &lt;<a
              href="mailto:alexdeucher@gmail.com" moz-do-not-send="true">alexdeucher@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Thu, Oct 21, 2021 at
            10:19 AM Christian König<br>
            &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com"
              target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt; Those members where renamed, update the kerneldoc as
            well.<br>
            &gt;<br>
            &gt; Signed-off-by: Christian König &lt;<a
              href="mailto:christian.koenig@amd.com" target="_blank"
              moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
            <br>
            Reviewed-by: Alex Deucher &lt;<a
              href="mailto:alexander.deucher@amd.com" target="_blank"
              moz-do-not-send="true">alexander.deucher@amd.com</a>&gt;<br>
          </blockquote>
          <div>LGTM, but perhaps you want to send it from your <a
              href="http://amd.com" moz-do-not-send="true">amd.com</a>
            account? <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Always using my gmail account instead because the AMD servers are
    only accessible through VPN.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Acked-by: Sumit Semwal &lt;<a
              href="mailto:sumit.semwal@linaro.org"
              moz-do-not-send="true">sumit.semwal@linaro.org</a>&gt;</div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            &gt; ---<br>
            &gt;  include/linux/dma-buf.h | 4 ++--<br>
            &gt;  1 file changed, 2 insertions(+), 2 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/include/linux/dma-buf.h
            b/include/linux/dma-buf.h<br>
            &gt; index 02c2eb874da6..9807aef33685 100644<br>
            &gt; --- a/include/linux/dma-buf.h<br>
            &gt; +++ b/include/linux/dma-buf.h<br>
            &gt; @@ -433,8 +433,8 @@ struct dma_buf {<br>
            &gt;         /** @poll: for userspace poll support */<br>
            &gt;         wait_queue_head_t poll;<br>
            &gt;<br>
            &gt; -       /** @cb_excl: for userspace poll support */<br>
            &gt; -       /** @cb_shared: for userspace poll support */<br>
            &gt; +       /** @cb_in: for userspace poll support */<br>
            &gt; +       /** @cb_out: for userspace poll support */<br>
            &gt;         struct dma_buf_poll_cb_t {<br>
            &gt;                 struct dma_fence_cb cb;<br>
            &gt;                 wait_queue_head_t *poll;<br>
            &gt; --<br>
            &gt; 2.25.1<br>
            &gt;<br>
          </blockquote>
        </div>
        <br clear="all">
        <div>Best,</div>
        <div>Sumit.</div>
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">Thanks and regards,<br>
            <br>
            Sumit Semwal (he / him)<br>
            Tech Lead - LCG, Vertical Technologies<br>
            Linaro.org │ Open source software for ARM SoCs</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------68004966166E5D1B914805E0--
