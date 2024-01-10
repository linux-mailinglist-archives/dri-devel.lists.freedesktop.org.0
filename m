Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27C829CE1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 15:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A048E10E5E9;
	Wed, 10 Jan 2024 14:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8663510E06A;
 Wed, 10 Jan 2024 14:54:22 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E7B912FC004A;
 Wed, 10 Jan 2024 15:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1704898460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qQ3GSPvx8gXjLv6y6c+K605XZueE+fVCeC8suaxpZWs=;
 b=gWByDBCSeUBVTM2qvmmGMT90O2hJNLovh84psgCaKbXtU9DxC1Lx0MjOKPkg/yF+9UA6r4
 9XcRTMfD1tcuOet8kESA9exrL+fV05ZTXJbC3rXyTL3ldW4TE4jbZWduagDnRuwJdJgvwm
 c/nCJpmIePas6JPK2zGehQyN3dx4oZw=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Content-Type: multipart/mixed; boundary="------------Jti0TC60AlZIJqEU4K1heZ0G"
Message-ID: <231df657-270c-478f-9076-3f5dedb195da@tuxedocomputers.com>
Date: Wed, 10 Jan 2024 15:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
Content-Language: en-US
To: Andri Yngvason <andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-6-andri@yngvason.is>
 <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
 <CAFNQBQzijyE4wR34AOLM45m+ryx128igVKO9zPJ5-M3afFQMxQ@mail.gmail.com>
 <92e20f9b-2cbf-4efe-b61b-989da0cc1668@tuxedocomputers.com>
 <CAFNQBQxnMh4aPfm+U8vEfxoTdQ+FByfqwUUDnMTzgkrW2+ZZqw@mail.gmail.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <CAFNQBQxnMh4aPfm+U8vEfxoTdQ+FByfqwUUDnMTzgkrW2+ZZqw@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Jti0TC60AlZIJqEU4K1heZ0G
Content-Type: multipart/alternative;
 boundary="------------2B7kbj1XSBvnKXnzg40VAu0B"

--------------2B7kbj1XSBvnKXnzg40VAu0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 10.01.24 um 14:42 schrieb Andri Yngvason:
> mið., 10. jan. 2024 kl. 13:09 skrifaði Werner Sembach<wse@tuxedocomputers.com>:
>> Hi,
>>
>> Am 10.01.24 um 11:11 schrieb Andri Yngvason:
>>> Hi,
>>>
>>> mið., 10. jan. 2024 kl. 09:27 skrifaði Maxime Ripard<mripard@kernel.org>:
>>>> On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
>>>>> From: Werner Sembach<wse@tuxedocomputers.com>
>>>>>
>>>>> Add a new general drm property "preferred color format" which can be used
>>>>> by userspace to tell the graphic drivers to which color format to use.
>>>>>
>>>>> Possible options are:
>>>>>       - auto (default/current behaviour)
>>>>>       - rgb
>>>>>       - ycbcr444
>>>>>       - ycbcr422 (not supported by both amdgpu and i915)
>>>>>       - ycbcr420
>>>>>
>>>>> In theory the auto option should choose the best available option for the
>>>>> current setup, but because of bad internal conversion some monitors look
>>>>> better with rgb and some with ycbcr444.
>>>> I looked at the patch and I couldn't find what is supposed to happen if
>>>> you set it to something else than auto, and the driver can't match that.
>>>> Are we supposed to fallback to the "auto" behaviour, or are we suppose
>>>> to reject the mode entirely?
>>>>
>>>> The combination with the active output format property suggests the
>>>> former, but we should document it explicitly.
>>> It is also my understanding that it should fall back to the "auto"
>>> behaviour. I will add this to the documentation.
>> Yes, that was the intention, and then userspace can check, but it wasn't well
>> received:https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_964530
>>
>> Actually a lot of the thoughts that went into the original patch set can be
>> found in that topic.
>>
>> There was another iteration of the patch set that I never finished and sent to
>> the LKML because I got discouraged by this:
>> https://lore.kernel.org/dri-devel/20210623102923.70877c1a@eldfell/
> Well, I've implemented this for sway and wlroots now and Simon has
> reacted positively, so this does appear likely to end up as a feature
> in wlroots based compositors.
>
>> I can try to dig it up, but it is completely untested and I don't think I still
>> have the respective TODO list anymore, so I don't know if it is a better or
>> worst starting point than the last iteration I sent to the LKML.
>>
> You can send the patches to me if you want and I can see if they're
> useful. I'm really only interested in the color format part though.
> Alternatively, you can continue your work and post it to LKML and I
> can focus on the userspace side and testing. By the way, I have an
> HDMI analyzer that can tell me the actual color format.

Searched for what I still had in my private repo, see attachments, filename is 
the branch name I used and like I said: I don't know which state these branches 
are in.

The hacking_ branch was based on 25fe90f43fa312213b653dc1f12fd2d80f855883 from 
linux-next and the rejected_ one on 132b189b72a94328f17fd70321bfe63e5b4208e9 
from drm-tip.

And the rejected_ one is 2 weeks newer.

To pick it up again I would first need to allocate some time for it, ... which 
could take some time.

With a HDMI analyzer at hand you are better equipped then me already. I was 
working with printf statements, Monitor OSD's and test patterns like 
https://media.extron.com/public/technology/landing/vector4k/img/scalfe-444Chroma.png 
and http://www.lagom.nl/lcd-test/ while being red blind xD.

>
> Thanks,
> Andri
--------------2B7kbj1XSBvnKXnzg40VAu0B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">Am 10.01.24 um 14:42 schrieb Andri
      Yngvason:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFNQBQxnMh4aPfm+U8vEfxoTdQ+FByfqwUUDnMTzgkrW2+ZZqw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">mið., 10. jan. 2024 kl. 13:09 skrifaði Werner Sembach <a class="moz-txt-link-rfc2396E" href="mailto:wse@tuxedocomputers.com">&lt;wse@tuxedocomputers.com&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

Am 10.01.24 um 11:11 schrieb Andri Yngvason:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi,

mið., 10. jan. 2024 kl. 09:27 skrifaði Maxime Ripard <a class="moz-txt-link-rfc2396E" href="mailto:mripard@kernel.org">&lt;mripard@kernel.org&gt;</a>:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: Werner Sembach <a class="moz-txt-link-rfc2396E" href="mailto:wse@tuxedocomputers.com">&lt;wse@tuxedocomputers.com&gt;</a>

Add a new general drm property "preferred color format" which can be used
by userspace to tell the graphic drivers to which color format to use.

Possible options are:
     - auto (default/current behaviour)
     - rgb
     - ycbcr444
     - ycbcr422 (not supported by both amdgpu and i915)
     - ycbcr420

In theory the auto option should choose the best available option for the
current setup, but because of bad internal conversion some monitors look
better with rgb and some with ycbcr444.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I looked at the patch and I couldn't find what is supposed to happen if
you set it to something else than auto, and the driver can't match that.
Are we supposed to fallback to the "auto" behaviour, or are we suppose
to reject the mode entirely?

The combination with the active output format property suggests the
former, but we should document it explicitly.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It is also my understanding that it should fall back to the "auto"
behaviour. I will add this to the documentation.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, that was the intention, and then userspace can check, but it wasn't well
received: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_964530">https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_964530</a>

Actually a lot of the thoughts that went into the original patch set can be
found in that topic.

There was another iteration of the patch set that I never finished and sent to
the LKML because I got discouraged by this:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/20210623102923.70877c1a@eldfell/">https://lore.kernel.org/dri-devel/20210623102923.70877c1a@eldfell/</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, I've implemented this for sway and wlroots now and Simon has
reacted positively, so this does appear likely to end up as a feature
in wlroots based compositors.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I can try to dig it up, but it is completely untested and I don't think I still
have the respective TODO list anymore, so I don't know if it is a better or
worst starting point than the last iteration I sent to the LKML.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You can send the patches to me if you want and I can see if they're
useful. I'm really only interested in the color format part though.
Alternatively, you can continue your work and post it to LKML and I
can focus on the userspace side and testing. By the way, I have an
HDMI analyzer that can tell me the actual color format.</pre>
    </blockquote>
    <p>Searched for what I still had in my private repo, see
      attachments, filename is the branch name I used and like I said: I
      don't know which state these branches are in.</p>
    <p>The hacking_ branch was based on <span
        style="color:#000000;background-color:#ffffff;">25fe90f43fa312213b653dc1f12fd2d80f855883
        from linux-next and the rejected_ one on
        132b189b72a94328f17fd70321bfe63e5b4208e9 from drm-tip</span>.</p>
    <p>And the rejected_ one is 2 weeks newer.</p>
    <p>To pick it up again I would first need to allocate some time for
      it, ... which could take some time.</p>
    <p>With a HDMI analyzer at hand you are better equipped then me
      already. I was working with printf statements, Monitor OSD's and
      test patterns like
<a class="moz-txt-link-freetext" href="https://media.extron.com/public/technology/landing/vector4k/img/scalfe-444Chroma.png">https://media.extron.com/public/technology/landing/vector4k/img/scalfe-444Chroma.png</a>
      and <a class="moz-txt-link-freetext" href="http://www.lagom.nl/lcd-test/">http://www.lagom.nl/lcd-test/</a> while being red blind xD.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFNQBQxnMh4aPfm+U8vEfxoTdQ+FByfqwUUDnMTzgkrW2+ZZqw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Andri
</pre>
    </blockquote>
  </body>
</html>

--------------2B7kbj1XSBvnKXnzg40VAu0B--

--------------Jti0TC60AlZIJqEU4K1heZ0G
Content-Type: application/gzip;
 name="hacking_drm_color_management_no_immutable_flag.tar.gz"
Content-Disposition: attachment;
 filename="hacking_drm_color_management_no_immutable_flag.tar.gz"
Content-Transfer-Encoding: base64

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
xQAcAQA=
--------------Jti0TC60AlZIJqEU4K1heZ0G
Content-Type: application/gzip; name="rejected_drm_color_management.tar.gz"
Content-Disposition: attachment;
 filename="rejected_drm_color_management.tar.gz"
Content-Transfer-Encoding: base64

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

--------------Jti0TC60AlZIJqEU4K1heZ0G--
