Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA482D73ED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EE56ED85;
	Fri, 11 Dec 2020 10:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DCB6ED85;
 Fri, 11 Dec 2020 10:28:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b73so8771325edf.13;
 Fri, 11 Dec 2020 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=F/owxLzE2PZQ78sXM58LscfIGvWvo6S0TJeSHHmmBj0=;
 b=N5hz4xtIY/AE02gAI7AW6xybL0Wvg40sNhYCAD++yREJrhl4D0/JyZPI4sivIAzCxe
 7XzwiSLkxOgJQvy/Hv/fu44f1D3kGe/WLQYmv+8HlpzX50EsSLLbwprNE8gtk944V/r3
 6fJWWHRlvpx1U5hJ34FbIKNea+1l1mUAI5fuw7h7eAs+FB4ePuucrlrE6hn1O9zYn9d1
 fw8Ytiu/8MDDJk3ocgaasiP2SXyW8xU2knKIOJs/M50enqYACuwXcMcoijJOeUfysWaf
 RcRVAgImJnOcnb2c1jng8BW3oO0HXQmLEciSDgOxwbWJVdArw1J7O1H7s+fBSFAB6WJz
 wSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=F/owxLzE2PZQ78sXM58LscfIGvWvo6S0TJeSHHmmBj0=;
 b=awzbL2RAbtx95DHmNeALo/WgilWJ7RISN+Ka/M+thXeZgLVs9CbRgAYu+YaXBJY98X
 CaSjuUqB5o/VzXhFJa0apiBFzCVBNnVeNA2CqO8D0HMG28e1Q/CYwfeea8942jaP9T8N
 spbk0OZXs5TVBO+bRjebEEpjBTa4dlKxLSb0vpfmMnSpXr/KsQa3j8ImVpsSUlIfqVJs
 P4VH1HKR/70zuN+8RvIelYV8KztjFlPvcXlitX5zXU+sT8K2ti9X554x3iNOAJJafnMy
 pXzU3Wv2QYBsjUI4SOvDLuUPQ1rYceKRZarH5Gnh0GgWwIIX/frvHh9iwlZ9tVsciY0U
 ELEA==
X-Gm-Message-State: AOAM533sGFwHarYxWZ7iOWksQe3f8tJ3sTmPHDEnTcUFeEvijPnOJGmG
 z12Q/fS1XntXKwi3Dgcr7pw=
X-Google-Smtp-Source: ABdhPJwFp+52hU4Sau8I+cVyTleemh2198k9q61APOazokRtq4JSKXi/2WYN0l6VMqayH7QrpE4poQ==
X-Received: by 2002:a50:ee97:: with SMTP id f23mr10667050edr.311.1607682519585; 
 Fri, 11 Dec 2020 02:28:39 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t19sm6465250eje.86.2020.12.11.02.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 02:28:38 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Shashank Sharma <shashank.sharma@amd.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
Date: Fri, 11 Dec 2020 11:28:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211115549.32ade81b@eldfell>
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
Reply-To: christian.koenig@amd.com
Cc: stylon.wang@amd.com, thong.thai@amd.com, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============1850382201=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1850382201==
Content-Type: multipart/alternative;
 boundary="------------FC82B3FD5A4781A0AEC371BD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FC82B3FD5A4781A0AEC371BD
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.12.20 um 10:55 schrieb Pekka Paalanen:
> On Fri, 11 Dec 2020 09:56:07 +0530
> Shashank Sharma <shashank.sharma@amd.com> wrote:
>
>> Hello Simon,
>>
>> Hope you are doing well,
>>
>> I was helping out Aurabindo and the team with the design, so I have
>> taken the liberty of adding some comments on behalf of the team,
>> Inline.
>>
>> On 11/12/20 3:31 am, Simon Ser wrote:
>>> Hi,
>>>
>>> (CC dri-devel, Pekka and Martin who might be interested in this as
>>> well.)
> Thanks for the Cc! This is very interesting to me, and because it was
> not Cc'd to dri-devel@ originally, I would have missed this otherwise.
>
>>> On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
>>>   
>>>> This patchset enables freesync video mode usecase where the userspace
>>>> can request a freesync compatible video mode such that switching to this
>>>> mode does not trigger blanking.
>>>>
>>>> This feature is guarded by a module parameter which is disabled by
>>>> default. Enabling this paramters adds additional modes to the driver
>>>> modelist, and also enables the optimization to skip modeset when using
>>>> one of these modes.
>>> Thanks for working on this, it's an interesting feature! However I'd like to
>>> take some time to think about the user-space API for this.
>>>
>>> As I understand it, some new synthetic modes are added, and user-space can
>>> perform a test-only atomic *without* ALLOW_MODESET to figure out whether it can
>>> switch to a mode without blanking the screen.
>> The implementation is in those lines, but a bit different. The idea
>> is to:
>>
>> - check if the monitor supports VRR,
>>
>> - If it does, add some new modes which are in the VRR tolerance
>> range, as new video modes in the list (with driver flag).
>>
>> - when you get modeset on any of these modes, skip the full modeset,
>> and just adjust the front_porch timing
>>
>> so they are not test-only as such, for any user-space these modes
>> will be as real as any other probed modes of the list.
> But is it worth to allow a modeset to be glitch-free if the userspace
> does not know they are glitch-free? I think if this is going in, it
> would be really useful to give the guarantees to userspace explicitly,
> and not leave this feature at an "accidentally no glitch sometimes"
> level.
>
>
> I have been expecting and hoping for the ability to change video mode
> timings without a modeset ever since I learnt that VRR is about
> front-porch adjustment, quite a while ago.
>
> This is how I envision userspace making use of it:
>
> Let us have a Wayland compositor, which uses fixed-frequency video
> modes, because it wants predictable vblank cycles. IOW, it will not
> enable VRR as such.

Well in general please keep in mind that this is just a short term 
solution for X11 applications.

For things like Wayland we probably want to approach this from a 
completely different vector.

> When the Wayland compositor starts, it will choose *some* video mode
> for an output. It may or may not be what a KMS driver calls "preferred
> mode", because it depends on things like user preferences. The
> compositor makes the initial modeset to this mode.

I think the general idea we settled on is that we specify an earliest 
display time for each frame and give feedback to the application when a 
frame was actually displayed.

This approach should also be able to handle multiple applications with 
different refresh rates. E.g. just think of a video playback with 25 and 
another one with 30 Hz in two windows when the max refresh rate is 
something like 120Hz.

Regards,
Christian.

>
> Use case 1:
>
> A Wayland client comes up and determines that its window would really
> like a refresh rate of, say, 47.5 Hz. Yes, it's not a traditional video
> player rate, but let's assume the application has its reasons. The
> client tells the compositor this (Wayland protocol still to be designed
> to be able to do that). (Hey, this could be how future games should
> implement refresh rate controls in cooperation with the window system.)
>
> The compositor sees the wish, and according to its complex policy
> rules, determines that yes, it shall try to honor that wish by changing
> the whole output temporarily to 47.5 Hz if possible.
>
> The compositor takes the original video mode it modeset on the output,
> and adjusts the front-porch to create a new custom 47.5 Hz mode. Using
> this mode, the compositor does a TEST_ONLY atomic commit *without*
> ALLOW_MODESET.
>
> If the test commit succeeds, the compositor knows that changing timings
> will not cause any kind of glitch, flicker, blanking, or freeze, and
> proceeds to commit this video mode without ALLOW_MODESET. The whole
> output becomes 47.5 Hz until the compositor policy again determines
> that it is time to change, e.g. to go back to the original mode. Going
> back to the original mode also needs to work without ALLOW_MODESET -
> but a compositor cannot test for this with atomic TEST_ONLY commits.
>
> If the test commit fails, the compositor knows that it cannot change
> the timings like this without risking a visible glitch. Therefore the
> compositor does not change the video mode timings, and the client's
> wish is not granted.
>
> The client adapts to whatever the refresh rate is in any case.
>
> Use case 2:
>
> A client comes up, and starts presenting frames with a target timestamp
> (Wayland protocol for this still to be designed). The compositor
> analyzes the target timestamp, and according to the complex compositor
> policy, determines that it should try to adjust video mode timings to
> better meet the target timestamps.
>
> Like in use case 1, the compositor creates a new custom video mode and
> tests if it can be applied without any glitch. If yes, it is used. If
> not, it is not used.
>
> This use case is more complicated, because the video mode timing
> changes may happen refresh by refresh, which means they need to
> apply for the very next front-porch in the scanout cycle in
> hardware. Hence, I'm not sure this use case is realistic. It can also
> be argued that this is better implemented by just enabling VRR and
> handling the flip timing in userspace, in the compositor: issue an
> atomic flip at the exact time it needs to be executed instead of
> issuing it well in advance and letting the driver wait for vblank.
>
>
> Worth to note: neither case needs the kernel to expose new manufactured
> video modes. Whether the feature is available or not is detected by an
> atomic TEST_ONLY commit without ALLOW_MODESET.
>
>>> However the exact modes amdgpu adds are just some guesses. I think it would be
>>> great if user-space could control the min/max refresh rate values directly.
> Setting min==max could be used to achieve the fixed refresh rate
> proposed here, but it would also allow setting custom min < max limits.
> This would be more flexible, but I'm not sure what the use case for it
> could look like... oh, there are the use cases mentioned below: user
> preferences. :-)
>
> Maybe the min/max setting is better than fiddling with custom video
> modes. If we have min/max to control, then there is no problem with
> going back to the "original" video mode like in my example use case 1.
>
>>> Not only this would remove the need for the kernel to hard-code "well-known
>>> video refresh rates", but this would also enable more use-cases. For instance
>>> some users might want to mitigate flickering on their screen by reducing the
>>> VRR range. Some users might want to lower their screen refresh rate for power
>>> savings.
>>>
>>> What do you think? Would you be fine with adding min/max VRR range properties?
>>>
>>> If you're scared about the user-space code requirement, I can
>>> provide that.
>> This sounds like a reasonable approach, and there is no reason why we
>> can't do this if we have the proper userspace support as you
>> mentioned.
> Maybe the min/max controls are the way to go, considering that
> the seamless refresh rate change feature in general cannot be
> implemented without VRR. Or can it?
>
> But if it can be implemented while not supporting VRR on some hardware,
> then the video mode fiddling without ALLOW_MODESET is still a usable
> approach. Or maybe such a driver could special-case VRR=enabled &&
> min==max.
>
> Yeah, min/max controls seems like the best idea to me so far.
>
>
> Thanks,
> pq
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------FC82B3FD5A4781A0AEC371BD
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.12.20 um 10:55 schrieb Pekka
      Paalanen:<br>
    </div>
    <blockquote type="cite" cite="mid:20201211115549.32ade81b@eldfell">
      <pre class="moz-quote-pre" wrap="">On Fri, 11 Dec 2020 09:56:07 +0530
Shashank Sharma <a class="moz-txt-link-rfc2396E" href="mailto:shashank.sharma@amd.com">&lt;shashank.sharma@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello Simon,

Hope you are doing well,

I was helping out Aurabindo and the team with the design, so I have
taken the liberty of adding some comments on behalf of the team,
Inline.

On 11/12/20 3:31 am, Simon Ser wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi,

(CC dri-devel, Pekka and Martin who might be interested in this as
well.)
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for the Cc! This is very interesting to me, and because it was
not Cc'd to dri-devel@ originally, I would have missed this otherwise.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a> wrote:
 
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default. Enabling this paramters adds additional modes to the driver
modelist, and also enables the optimization to skip modeset when using
one of these modes.  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Thanks for working on this, it's an interesting feature! However I'd like to
take some time to think about the user-space API for this.

As I understand it, some new synthetic modes are added, and user-space can
perform a test-only atomic *without* ALLOW_MODESET to figure out whether it can
switch to a mode without blanking the screen.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The implementation is in those lines, but a bit different. The idea
is to:

- check if the monitor supports VRR,

- If it does, add some new modes which are in the VRR tolerance
range, as new video modes in the list (with driver flag).

- when you get modeset on any of these modes, skip the full modeset,
and just adjust the front_porch timing

so they are not test-only as such, for any user-space these modes
will be as real as any other probed modes of the list.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But is it worth to allow a modeset to be glitch-free if the userspace
does not know they are glitch-free? I think if this is going in, it
would be really useful to give the guarantees to userspace explicitly,
and not leave this feature at an "accidentally no glitch sometimes"
level.


I have been expecting and hoping for the ability to change video mode
timings without a modeset ever since I learnt that VRR is about
front-porch adjustment, quite a while ago.

This is how I envision userspace making use of it:

Let us have a Wayland compositor, which uses fixed-frequency video
modes, because it wants predictable vblank cycles. IOW, it will not
enable VRR as such.</pre>
    </blockquote>
    <br>
    Well in general please keep in mind that this is just a short term
    solution for X11 applications.<br>
    <br>
    For things like Wayland we probably want to approach this from a
    completely different vector.<br>
    <br>
    <blockquote type="cite" cite="mid:20201211115549.32ade81b@eldfell">
      <pre class="moz-quote-pre" wrap="">When the Wayland compositor starts, it will choose *some* video mode
for an output. It may or may not be what a KMS driver calls "preferred
mode", because it depends on things like user preferences. The
compositor makes the initial modeset to this mode.</pre>
    </blockquote>
    <br>
    I think the general idea we settled on is that we specify an
    earliest display time for each frame and give feedback to the
    application when a frame was actually displayed.<br>
    <br>
    This approach should also be able to handle multiple applications
    with different refresh rates. E.g. just think of a video playback
    with 25 and another one with 30 Hz in two windows when the max
    refresh rate is something like 120Hz.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20201211115549.32ade81b@eldfell">
      <pre class="moz-quote-pre" wrap="">

Use case 1:

A Wayland client comes up and determines that its window would really
like a refresh rate of, say, 47.5 Hz. Yes, it's not a traditional video
player rate, but let's assume the application has its reasons. The
client tells the compositor this (Wayland protocol still to be designed
to be able to do that). (Hey, this could be how future games should
implement refresh rate controls in cooperation with the window system.)

The compositor sees the wish, and according to its complex policy
rules, determines that yes, it shall try to honor that wish by changing
the whole output temporarily to 47.5 Hz if possible.

The compositor takes the original video mode it modeset on the output,
and adjusts the front-porch to create a new custom 47.5 Hz mode. Using
this mode, the compositor does a TEST_ONLY atomic commit *without*
ALLOW_MODESET.

If the test commit succeeds, the compositor knows that changing timings
will not cause any kind of glitch, flicker, blanking, or freeze, and
proceeds to commit this video mode without ALLOW_MODESET. The whole
output becomes 47.5 Hz until the compositor policy again determines
that it is time to change, e.g. to go back to the original mode. Going
back to the original mode also needs to work without ALLOW_MODESET -
but a compositor cannot test for this with atomic TEST_ONLY commits.

If the test commit fails, the compositor knows that it cannot change
the timings like this without risking a visible glitch. Therefore the
compositor does not change the video mode timings, and the client's
wish is not granted.

The client adapts to whatever the refresh rate is in any case.

Use case 2:

A client comes up, and starts presenting frames with a target timestamp
(Wayland protocol for this still to be designed). The compositor
analyzes the target timestamp, and according to the complex compositor
policy, determines that it should try to adjust video mode timings to
better meet the target timestamps.

Like in use case 1, the compositor creates a new custom video mode and
tests if it can be applied without any glitch. If yes, it is used. If
not, it is not used.

This use case is more complicated, because the video mode timing
changes may happen refresh by refresh, which means they need to
apply for the very next front-porch in the scanout cycle in
hardware. Hence, I'm not sure this use case is realistic. It can also
be argued that this is better implemented by just enabling VRR and
handling the flip timing in userspace, in the compositor: issue an
atomic flip at the exact time it needs to be executed instead of
issuing it well in advance and letting the driver wait for vblank.


Worth to note: neither case needs the kernel to expose new manufactured
video modes. Whether the feature is available or not is detected by an
atomic TEST_ONLY commit without ALLOW_MODESET.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">However the exact modes amdgpu adds are just some guesses. I think it would be
great if user-space could control the min/max refresh rate values directly.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Setting min==max could be used to achieve the fixed refresh rate
proposed here, but it would also allow setting custom min &lt; max limits.
This would be more flexible, but I'm not sure what the use case for it
could look like... oh, there are the use cases mentioned below: user
preferences. :-)

Maybe the min/max setting is better than fiddling with custom video
modes. If we have min/max to control, then there is no problem with
going back to the "original" video mode like in my example use case 1.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Not only this would remove the need for the kernel to hard-code "well-known
video refresh rates", but this would also enable more use-cases. For instance
some users might want to mitigate flickering on their screen by reducing the
VRR range. Some users might want to lower their screen refresh rate for power
savings.

What do you think? Would you be fine with adding min/max VRR range properties?

If you're scared about the user-space code requirement, I can
provide that.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This sounds like a reasonable approach, and there is no reason why we
can't do this if we have the proper userspace support as you
mentioned.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe the min/max controls are the way to go, considering that
the seamless refresh rate change feature in general cannot be
implemented without VRR. Or can it?

But if it can be implemented while not supporting VRR on some hardware,
then the video mode fiddling without ALLOW_MODESET is still a usable
approach. Or maybe such a driver could special-case VRR=enabled &amp;&amp;
min==max.

Yeah, min/max controls seems like the best idea to me so far.


Thanks,
pq
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FC82B3FD5A4781A0AEC371BD--

--===============1850382201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1850382201==--
