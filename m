Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5228F1BFF54
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7DC6E91F;
	Thu, 30 Apr 2020 14:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74456E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588258537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROSZXXwHuAoegHhHptcwDaaOjUXpGiypsx5adh+Nj7Y=;
 b=hh1vQAC0LkVPpKT5QFfjJyTd9PWLfus4TyDZoRqTGsF7CYhzIF9c5bfspuevX6S5c0b5FH
 CKS+ioyB3bpqYQRmHeIPu5ZWRL82HQDE6IRVt+hXzLT0+YRzO42k0N171R44OxYoundB8P
 BHDczSkbLR3B/2KSgaTBLrsFaYP83qA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-rdN6uSz2OamvtDxfpmyYqw-1; Thu, 30 Apr 2020 10:55:35 -0400
X-MC-Unique: rdN6uSz2OamvtDxfpmyYqw-1
Received: by mail-wr1-f70.google.com with SMTP id j22so4021740wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PfvzMRq0z2wKK0QNXzOp5dWffHmPOZwFLXzDTjduEOY=;
 b=eNnBo8XevLtdOVuDIXLmI8i00mqb/NfFU/rKNcZj2eN6RMeHUQ5riEYGRa/Lsn7Ry0
 8316koReACiX+4b2rq4cfgVDdXsdUnV4KrvQqtewzCa5AokwHKIlTAziWTCiDdJuI8PH
 49iEvii4o8vNa6iT5V5LYcxVFctEA3OhKEyuGFt+fXE6sHS8WaXm7IkptfmAm3bWnwHu
 3SYtoeg4pmE7AEYQqu0pbkyfco0fWc8do/diS0j+qM9wCeVROq7WtFPqKDanYevT57Ji
 khJqze9THxr+8OH5rMCcYLSfHxDAXOwuiuSeQtbWw2nu/w6ieMjNax4DUKMDw3DBAAlX
 Vlhw==
X-Gm-Message-State: AGi0PuYY/2iBZjkv11GH7T7+g3LoulPffam15JBsA+qk09zZVkOVmCOE
 rtl5xD9MUOQxK3H2gyxmJauvNUWbTVaSi4wyvPsBxJHCmTJTyUn7p4POqmJ08u0QZ4Yi4ep7tJ/
 LdKXcXoGUAxw8bcRgiloFxloonZgI
X-Received: by 2002:a5d:5001:: with SMTP id e1mr4490225wrt.27.1588258533716;
 Thu, 30 Apr 2020 07:55:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJFVQzzZMs0GnbAsHlLc/Qa2p8YAFheR8bjYkfrVPTO89aT9H6mk+jso1yDnPEbkfsaU9JIzQ==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr4490205wrt.27.1588258533529;
 Thu, 30 Apr 2020 07:55:33 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id g15sm4414760wrp.96.2020.04.30.07.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 07:55:32 -0700 (PDT)
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
 <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
 <20200430145250.GX6112@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a596b05a-a434-56c7-b3c6-ab070df2f00f@redhat.com>
Date: Thu, 30 Apr 2020 16:55:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200430145250.GX6112@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/30/20 4:52 PM, Ville Syrj=E4l=E4 wrote:
> On Thu, Apr 30, 2020 at 02:47:00PM +0100, Emil Velikov wrote:
>> Hi Hans,
>>
>> On Fri, 21 Feb 2020 at 17:33, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> drm_helper_probe_add_cmdline_mode() prefers using a probed mode matching
>>> a video=3D argument over calculating our own timings for the user speci=
fied
>>> mode using CVT or GTF.
>>>
>>> But userspace code which is auto-configuring the mode may want to know =
that
>>> the user has specified that mode on the kernel commandline so that it c=
an
>>> pick that mode over the mode which is marked as DRM_MODE_TYPE_PREFERRED.
>>>
>>> This commit sets the DRM_MODE_TYPE_USERDEF flag on the matching mode, j=
ust
>>> as we would do on the user-specified mode when no matching probed mode =
is
>>> found.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> I was skimming around wrt Ville's compact drm_display_mode series and
>> noticed that this never landed.
>>
>> The commit brings extra consistency when dealing with user defined
>> modes, and is:
>> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
>>
>> Ville this may trivially conflict with your work. I suspect you can do
>> the honours, and apply on top of your series?
>> That is if you agree with the patch.
> =

> Quick glance at the original thread says maybe there were still some
> userspace issues unresolved? Not sure.

IIRC the thread ended with Daniel agreeing on the userspace interface,
but asking for some docs and me pointing out that the patch already
updated/clarified the existing docs. After that things got quiet.

So I believe that this is (still) ready to go upstream.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
