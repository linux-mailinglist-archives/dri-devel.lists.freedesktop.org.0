Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68BC320D4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8263D10E27D;
	Tue,  4 Nov 2025 16:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="UHNmp14U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com
 [209.85.210.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7510E27D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 16:27:20 +0000 (UTC)
Received: by mail-ot1-f98.google.com with SMTP id
 46e09a7af769-7c53f916ef1so1736656a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 08:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762273640; x=1762878440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i4dEd7yuxUPLIDVjUZ9ElgZsZg5TDHQNtbxvUxqfS1c=;
 b=ukeXTysV7G3fXs+F61pM7V5TTuKNttakNMh0PmO+CArW5W0S2z6Odpds7LmN3zzeE/
 dli1HkACvvVMwZqwO0JC80o9J8zwtkm6zBDSg4m43B76yjIHuavi7rQaBjnhStHszMEg
 JQTl38UwXulF/gl9JP6xqDELOcWp5IwaJrBr6ykcSTzrlP3lEfpUGB7Y3fAUOjU6pZlr
 mqchdS3YrMWKBnU72sVLU91ZbX0nr754mcxAhRpE82aLZANLyYHZOq5HtQX4w0ooh/up
 acyhuU4/tojpeWosg1OMenUDBud+qsDymrcfVFvhTVNo52bLM2ZzXOZkG45ICQ/81Ej3
 L/Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhyM3KfcnG+BOMS/n6zr+yc710T/LzWqbuvbSDvF2/J/KVItheVongm0X6TON3wsgt7YqPoIjnQXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLk/6eC4F+zcdv8mYQhYgne+PIjEl45L9eA6LneXfs3a5purH6
 Ls6niU2PjvNGBekV3ZC3AU3HzT4ScnRpdLfRohwkQOQMGnmaS1AKS1oe2aNC0Hg0uLbaXXLEwkl
 UQO4eo4CEXYv5cYr6k9UVuaQi9qkhOaX+09tCSycPQIiBgjV4zmYN9JhGeU3BAQbblUoMLELxD8
 ObkqoGC0xJz0JEVQeIDCFaeGTnpuEGRmoh/ZYcIOOTqSWJ6KFsBcIZRiCfFcyr+yhp/AE2okIqp
 wTdz4lbzraa6IYLgjic
X-Gm-Gg: ASbGncsIZFdIfXrh8c6sIR6Mn179oJCmtpEFXS9CPhvpVgiCjBKbTDGMmd8++Zbry6h
 nmkBzSU9ly/HcIkUaNW352RIiSUpBKoKUM2Lmr91hE2OcM9MN+qPqVSz24p9YfOfHZkvd/UL6oJ
 vGF+LgNXpkOYgsUkfNitBoQR/Hm6KyUwxS6GuG3hmFqUtoZMxma3KzdYzLZtgFfA9gOJRcgx24g
 QOsJ2mn1/lWQmDSxKeLm8f3geaNy89aki3pxmewXK6HU9VMYPeyD8Xw7Qpa1BM3X54hF5oa1IuJ
 kZw4WXVyNVuG7ae50ItnaJcxU6KqxdValq7QHAFb9VQS7lTiTLYGhgcOvdL0Dj5SR/t8jq5wPjF
 Q+tkLBD8Z9Vieej1DE3uHPEXPnlQukGxOzGFmOlSs1amtFcBTowFqH7Ft/3m66uwpHy1tBqsNSH
 qVz+9pyshJXzRgm46ySce3RjrrE6Ey9wU=
X-Google-Smtp-Source: AGHT+IGN/REJlZE5vZKFA9t8Tx0wbViEelU6pOD4zas0orlEBh7+F6UQUcacWgWpRK+lXJXd3u9Pou5Y6nVf
X-Received: by 2002:a05:6830:3e07:b0:7a2:deb:b8d4 with SMTP id
 46e09a7af769-7c6d143ef4dmr63585a34.36.1762273639520; 
 Tue, 04 Nov 2025 08:27:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
 by smtp-relay.gmail.com with ESMTPS id
 46e09a7af769-7c6c24d711fsm250166a34.3.2025.11.04.08.27.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Nov 2025 08:27:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429c17b29f3so3027338f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 08:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1762273637; x=1762878437;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i4dEd7yuxUPLIDVjUZ9ElgZsZg5TDHQNtbxvUxqfS1c=;
 b=UHNmp14UBLyv025yzx1uxvnMuihqpB2ZFAykp1rv9asYNno7zXvJOvTd7YbwXnE8K8
 A0awn28MEVnR1t75gTlpHGIN35gYbL1FExxB78zED8MgSF0SCV8GMhp4EewvG3FFb9nh
 6PcIeX6xn+2HuFJoY1Ne03d2fhYRx29ChzLDU=
X-Forwarded-Encrypted: i=1;
 AJvYcCWRiN/3CZ5yhzAfnuMR4vL/BLnWnA2tZBwoS7DujEgxb+m4bfjQpXBeeT+wr24pIt3tIlBciJfAgAA=@lists.freedesktop.org
X-Received: by 2002:a05:6000:4614:b0:429:c851:69b3 with SMTP id
 ffacd0b85a97d-429c851a88dmr8728726f8f.30.1762273636929; 
 Tue, 04 Nov 2025 08:27:16 -0800 (PST)
X-Received: by 2002:a05:6000:4614:b0:429:c851:69b3 with SMTP id
 ffacd0b85a97d-429c851a88dmr8728708f8f.30.1762273636534; Tue, 04 Nov 2025
 08:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20251104103611.167821-1-tzimmermann@suse.de>
In-Reply-To: <20251104103611.167821-1-tzimmermann@suse.de>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Tue, 4 Nov 2025 10:27:05 -0600
X-Gm-Features: AWmQ_bnTZ6mrHh7jytp2wACQWeuxBmGzazNfTfMggoGTmqMwRuEPwGzPqUqQRzw
Message-ID: <CAO6MGth78d=JBAf4L98NV_dTxjTu6UaPa83Oqoa0ej-P-nrXPA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Set surface-framebuffer GEM objects
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000002603c50642c74e3d"
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

--0000000000002603c50642c74e3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 4:36=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Set struct drm_framebuffer.obj[0] to the allocated GEM buffer object
> for surface framebuffers. Avoids a NULL-pointer deref in the client's
> vmap helpers.
>

Tested Working.

Tested-by: Ian Forbes <ian.forbes@broadcom.com>

--0000000000002603c50642c74e3d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVIgYJKoZIhvcNAQcCoIIVEzCCFQ8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghKPMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGWDCCBECg
AwIBAgIMdv+fjzxf0KFt9De7MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NDcxOVoXDTI2MTEyOTA2NDcxOVowgaUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjETMBEGA1UEAxMKSWFuIEZvcmJlczEmMCQGCSqG
SIb3DQEJARYXaWFuLmZvcmJlc0Bicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQC2AMlK9RdoCw8arN33t70vxMApCT5iWUWUvifzr+uPD1yUo6FYiadl5yCjOgy5+a/b
yDWISjqDL/DJ1OAopJ9LEPqznspPNSFvQ9pOB7Z3CIITWi2QoSJMjlmG2GIXLe3wQQJ9CVwF8Dlc
V0fYJUiKJMCwvDmndOil8EtMA8j2T6taUZoQINiKQ0oDWgY6eYVv7AdPVIeOOs3noCyUL8AyA7Bl
yoOPBB2/gk8VGcolEKgAAj+3hPbBF/d19x1bZzU3wABizBomVwykx5ms1nVXDbQajz8jqYECKWh9
3OMo7BuC3TAClu5mLr2zs0Ccpp6NRRkjTF8WtCJ+jSnjFJGLAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF2lhbi5mb3JiZXNAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSvJWzgGK7aSByS+CQVBVfM
Xgm5azANBgkqhkiG9w0BAQsFAAOCAgEAfrWiLF3zrYq7D+KPNRaAP70FbxHeaiUfn27Hbu37Eefz
xeJTcFZH04IEtXqpM3NWYZm4A/dFn/VQPbLCRaeXzpT2TESVH6EFY7BEF0rnSSlUbFyi000MnSH3
h5m+MoyE+PzLqfzLBZS+EU/haCpPy6Nqhs3fPKG3w5VTnUPsAxXK7rSmkIDVNsvwRttuMq9KHJzH
Bx51dP/z3mel4OuMjgrwHk5uNY1Sn1MZAUQztVUsWguyfoKcmhxXbBccR5DdEfBgDEbq8bicPQ3J
kqEy1QZXJfHlJuAJIiEw7odGctwqLeGCU6cBLhnsg54ngjO3uYC6tIySul55MRxFKE8HIwIrx+D5
2SwhDeVLZ8sTK40uPzW5xg5laOWVCvmy2b+cHCGzarUeIlYdtw0ejdH9Hbkm0G7IrDvjkhPa64gR
6Q+m5CGRDk+8iWhieH6WFE4HL++BpZhoi+YsOkGU3DK0dA+pxQnXNcNw1s0eNbSUVwQzmlC4LqiK
Gj5JV81HTPLhoAya57a9i28Fp5qHZiFnCq4HMvwiwY7IWe+UwUuueU199aTK80xNiS553vHc6FpI
/vxGy+LveJqEtodfKqQKwDOVu//c1Lz3uergJHqFYTMykk5U95J3FG5q/7Mqe4RF6E9OgtuAJidS
6Ca5anjLQ/qzIfTjoXX7TJSjPztehRQxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgx2/5+PPF/QoW30N7swDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPmw
/rXIeXog6rb+iYOUq99Jpd+fW0FiI8VDPncLrxZPMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTEwNDE2MjcxN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADD1RzgiUfkSYCW5gC+O5VpTSCsURhpvJTxpgWsK
FMBoVgCzFNMvZsRAVrMovim1dQX7LACn4Tu5s6vjkRG+D1HakY0mUdmd42jymyEj9gK+AaAPdPy9
TN6ZXPG3ZZM7GBQ2aARGyC+BfNpP44iZlGR9+qnYT6ZITST7InSQa0CI3bKQTNdWsDnuOhhBeK1r
QbOplq9akLEb6cCv5rN+M/COygu200XRlv3axONQvnWoIKF/eTs+YcfKwxmkS1LHAzHmkI3YkIJU
ts/8Ik/lvWNTn/v9c4CRC74enbFUn5wZ+sfdBqFUt4DXSgzpu0DL/aYoUf2Lq62CpL3GOdKy08Q=
--0000000000002603c50642c74e3d--
