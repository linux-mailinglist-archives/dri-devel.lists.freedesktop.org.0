Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4435F2F41
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 13:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C410E305;
	Mon,  3 Oct 2022 11:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676910E2FB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664794961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBRaEk64P6mie4C7pS6Mkny4/N0w0c7seruBIYCPAk0=;
 b=Gk+14CvNFr63LJ+k0UrwYHDULpN1xuWMxGcxDb2VahMyp1Qn6QVGUjBRAzJHmOqRGobGsC
 qFs2ydPC+x4Ntq+nDoZUDSfPAricsrWsWWxQqUP3gS3AvTlqFSnOGBGtcuF7VGtsuavPvt
 EuVCs0QTVRqoK0zOxmzDQZLZloV4TVk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-tcn0Ut6MNpm1kBp3XAoDMg-1; Mon, 03 Oct 2022 07:02:40 -0400
X-MC-Unique: tcn0Ut6MNpm1kBp3XAoDMg-1
Received: by mail-ej1-f70.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso3145233ejb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 04:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XBRaEk64P6mie4C7pS6Mkny4/N0w0c7seruBIYCPAk0=;
 b=ufwoTlozRonLCbSEugCdLEoF7JeBusvyy0cxxST9TaVE2CeSPB99npj2opDfLREjgR
 DgSH5kfpfuhibSVslgaPPjWYqQQW3a4qEvyQvVkYey/3D0NHU9/DI5bJ2AMFbbr1ZiYF
 qkl4q9C2OmFUoYMsE2P8X8lsKCVImijSF75cn63fc3jMKg6qaVWYqakEkdCbouAcuo8i
 57FeGgpo1BnroWilW/hm+6eGyorWKjhfVJMMsY9BbjBP9spYXC/yvRbiYQLdHHnyHnb9
 sNkGpTPs5gR5y6/izWyMeslEvSkFZQ3WmWc6cdpjyFte9fNbeu6zkBozIk4T7ROdfiAH
 llqw==
X-Gm-Message-State: ACrzQf2ikibyjzA2h/k3zEMhQxdmV2gH/IhhbElPDTptmppsJ9vFECtl
 0czaNb2hu3EcWnLRSecMUrqP4ydQAkAt5a+h42GBGB/hVDPxGYTzif2rko24JRT85PjleftArNR
 izc0pHoZqX1MBJoHoQIkyVNf1Rda2
X-Received: by 2002:aa7:cc86:0:b0:457:f801:2951 with SMTP id
 p6-20020aa7cc86000000b00457f8012951mr18246641edt.16.1664794959074; 
 Mon, 03 Oct 2022 04:02:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5eCoztAiejpswbMucVDYiGb7go5+FMjlw/DVout72wfrQ5NqQlQNh8MISCADxllyOZYwtyiw==
X-Received: by 2002:aa7:cc86:0:b0:457:f801:2951 with SMTP id
 p6-20020aa7cc86000000b00457f8012951mr18246607edt.16.1664794958815; 
 Mon, 03 Oct 2022 04:02:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170906538300b0078128c89439sm5269220ejo.6.2022.10.03.04.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 04:02:37 -0700 (PDT)
Message-ID: <627fd6ee-3811-70fb-2615-50730965104e@redhat.com>
Date: Mon, 3 Oct 2022 13:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
 <44df4468-955b-0226-67e7-89467291d38f@redhat.com>
 <20221003133222.7f34862f@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221003133222.7f34862f@eldfell>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/3/22 12:32, Pekka Paalanen wrote:
> On Mon, 3 Oct 2022 11:44:56 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> One example mentioned here is that laptops with Intel integrated
>> graphics may have some "perceived brightness" mapping table
>> in their Video BIOS Tables (VBT) it would be interesting to use
>> this and to export the curve coming from that to userspace as
>> extra information (including allow userspace to write it).
>> Since in this case (unlike many other cases) at least this
>> curve is done in the kernel I guess we can then also add a boolean
>> property to disable the curve (making it linear) in case that
>> is helpful for HDR scenarios.
> 
> Hi Hans,
> 
> what if you would export that curve to userspace and not apply it in
> the kernel, aside from the min-luminance=0 offset?
> 
> I'm not sure if that was your intention, I didn't see it clearly said.
> Of course this can be only about curves that are supposed to be applied
> by the OS and not applied in firmware or hardware. Call it "software
> curve"?
> 
> Let userspace apply that curve if it happens to exist. Then, if we get
> some other definition replacing that curve on some hardware, the kernel
> could just expose the other thing as a new thing, and the old curve API
> would not be interfering. Userspace that does not understand the new
> thing (and the old curve property is not populated) would still be able
> to control the brightness, just not in as pleasant way.
> 
> It would also make using a custom curve a completely userspace thing with
> no need for the kernel to support overwriting it.

Userspace comes in many forms, which is why my preference for "software curve"
support would be for it to be applied by the kernel by default (if present
in the VBT) but then with a "software curve enable" flag to allow advanced
userspace to disable it and then apply a curve of userspace's own choosing
itself.

This allows a simple implementation for desktop-environments which are
unlikely to implement all this themselves, giving everyone the benefit of
the nicer behavior of the VBT provided curve while allowing advanced
desktop environments (likely mainly KDE + GNOME/mutter) to do something
more advanced.

Either way, this is all future extensions. First lets get the basic
brightness control with just brightness + brightness-max attributes
in place.

Regards,

Hans

