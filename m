Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB40365B9B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B7889A44;
	Tue, 20 Apr 2021 14:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8960689A44;
 Tue, 20 Apr 2021 14:58:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k17so5963196edr.7;
 Tue, 20 Apr 2021 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=01xSZQVJEpHLgOnRutuJgKAj645c4F0D7/FWYZc5+nE=;
 b=Tyn6UXFKyrMsf+xZEO/qyNtxo247A3fqfg582O7ANkCzQ8eycszUlH9e3VYJ2akWDo
 MqORIajw1NDR11akUn+ySz9otSB7M7+N+OGf9z4baxeMDvXaeJYXA7p0RJu+gEjSaeRW
 mANm7dxCfIisoKf/ruQbwOB6h9dBtOcowbguLBYPsgCbyr2M7deB5zfTCRlcRoNfr5VT
 0De1Y0aY5p30h7anW4AiLB0/oszHF8LZ3l7NNTMlTcCu7b1KegRZhmHRD2LxkS5KKGSx
 hbwFi83YIgFVCXtMpGuqlLg3k/zkiXGL8pcXwPwAT4Q6DSnZaQkOX4uuMj0Lrr9GdSkB
 w+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=01xSZQVJEpHLgOnRutuJgKAj645c4F0D7/FWYZc5+nE=;
 b=eH/oRvgXuzFB/a2FpeD3fHuFo3KuTCPMZ3mODMusPll07gLN0dRwClfDf7tghPhXeW
 dWicuYBupoczgFDONQI9nJ9UGaHlcHJMKjD5khSpiT5sCGr6OhgKHn11L4HYIiWaqQ0v
 /UiydsvAkxUe4RzIQZtdr0a8f1hwTvBFvhmLixEfIVC55Q+clf1ObhTTeEHMhnuYOhib
 p8mjxf0fcKoXkUg+dTQnD32Yu1iCPzg7cqieGguQjqnMCa6xklWTN8DZ8twtmO/qwRku
 TZBkKI6BChp1Q73vGz44sbfKU5ZBoZ4jF4njUvJzPGkbAJI/XeP/sx2GK8bLPecvH6tf
 qaGQ==
X-Gm-Message-State: AOAM531YDm/KxBVhpftsnZY5Uy46fQBVv0ckHt8Dz/afDDe1kh/2qNVu
 tsD20IwS4MizSEtz8tuo9ruAe6RMXeY=
X-Google-Smtp-Source: ABdhPJzsdvnT+xVU+UKCb13TdM0xvj78m5LQTuxG2k4uhCrADpPz8BrZPRnul5bOxSwsjRo8GG2N2A==
X-Received: by 2002:aa7:da18:: with SMTP id r24mr32166392eds.198.1618930736214; 
 Tue, 20 Apr 2021 07:58:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3caf:a441:2498:1468?
 ([2a02:908:1252:fb60:3caf:a441:2498:1468])
 by smtp.gmail.com with ESMTPSA id b6sm5010097edd.18.2021.04.20.07.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 07:58:55 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
Date: Tue, 20 Apr 2021 16:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1250323618=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1250323618==
Content-Type: multipart/alternative;
 boundary="------------453861F0E7C28283C5975F07"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------453861F0E7C28283C5975F07
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 20.04.21 um 16:53 schrieb Daniel Stone:
> Hi,
>
> On Mon, 19 Apr 2021 at 11:48, Marek Olšák <maraeo@gmail.com 
> <mailto:maraeo@gmail.com>> wrote:
>
>     Deadlock mitigation to recover from segfaults:
>     - The kernel knows which process is obliged to signal which fence.
>     This information is part of the Present request and supplied by
>     userspace.
>     - If the producer crashes, the kernel signals the submit fence, so
>     that the consumer can make forward progress.
>     - If the consumer crashes, the kernel signals the return fence, so
>     that the producer can reclaim the buffer.
>     - A GPU hang signals all fences. Other deadlocks will be handled
>     like GPU hangs.
>
>
> Another thought: with completely arbitrary userspace fencing, none of 
> this is helpful either. If the compositor can't guarantee that a 
> hostile client has submitted a fence which will never be signaled, 
> then it won't be waiting on it, so it already needs infrastructure to 
> handle something like this.

> That already handles the crashed-client case, because if the client 
> crashes, then its connection will be dropped, which will trigger the 
> compositor to destroy all its resources anyway, including any pending 
> waits.

Exactly that's the problem. A compositor isn't immediately informed that 
the client crashed, instead it is still referencing the buffer and 
trying to use it for compositing.

>
> GPU hangs also look pretty similar; it's an infinite wait, until the 
> client resubmits a new buffer which would replace (& discard) the old.

Correct. You just need to assume that all queues get destroyed and 
re-initialized when a GPU reset happens.

>
> So signal-fence-on-process-exit isn't helpful and doesn't provide any 
> extra reliability; it in fact probably just complicates things.

Well it is when you go for partial GPU resets.

Regards,
Christian.

>
> Cheers,
> Daniel
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


--------------453861F0E7C28283C5975F07
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 20.04.21 um 16:53 schrieb Daniel
      Stone:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi,</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, 19 Apr 2021 at
            11:48, Marek Olšák &lt;<a href="mailto:maraeo@gmail.com"
              moz-do-not-send="true">maraeo@gmail.com</a>&gt; wrote:</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div><span style="">Deadlock mitigation to recover from
                  segfaults:</span><br>
              </div>
              <div>- The kernel knows which process is obliged to signal
                which fence. This information is part of the Present
                request and supplied by userspace.<br>
              </div>
              <div>- If the producer crashes, the kernel signals the
                submit fence, so that the consumer can make forward
                progress.</div>
              <div>- If the consumer crashes, the kernel signals the
                return fence, so that the producer can reclaim the
                buffer.</div>
              <div>- A GPU hang signals all fences. Other deadlocks will
                be handled like GPU hangs.</div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Another thought: with completely arbitrary userspace
            fencing, none of this is helpful either. If the compositor
            can't guarantee that a hostile client has submitted a fence
            which will never be signaled, then it won't be waiting on
            it, so it already needs infrastructure to handle something
            like this. </div>
        </div>
      </div>
    </blockquote>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>That already handles the crashed-client case, because if
            the client crashes, then its connection will be dropped,
            which will trigger the compositor to destroy all its
            resources anyway, including any pending waits.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Exactly that's the problem. A compositor isn't immediately informed
    that the client crashed, instead it is still referencing the buffer
    and trying to use it for compositing.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>GPU hangs also look pretty similar; it's an infinite
            wait, until the client resubmits a new buffer which would
            replace (&amp; discard) the old.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Correct. You just need to assume that all queues get destroyed and
    re-initialized when a GPU reset happens.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>So signal-fence-on-process-exit isn't helpful and doesn't
            provide any extra reliability; it in fact probably just
            complicates things.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Well it is when you go for partial GPU resets.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><span style=""><br>
            </span></div>
          <div><span style="">Cheers,</span></div>
          <div><span style="">Daniel </span></div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
mesa-dev mailing list
<a class="moz-txt-link-abbreviated" href="mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------453861F0E7C28283C5975F07--

--===============1250323618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1250323618==--
