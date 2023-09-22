Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE457AAB31
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C6A10E62D;
	Fri, 22 Sep 2023 08:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244EB10E62D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:00:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405290ab4b6so86325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695369633; x=1695974433;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NprMZCfk8vfqkafckCULVA3+3btHCTfBpJu0SPpDVfE=;
 b=H/JFgVWjo7zDuGgicarf6A7DC/3TEg0a3MGe1Qtn1obHSidYODhJpVkKV93ao7zCwT
 RCr9RQXq+cgEXC8bI+htHNu0LzSPTXQ+8EYBnYcDtLv5O54t//X5GlC3OjTdGYTUJKV0
 7FZOBKULWjjzlo8EpmJx4XcMQi9Zd6juLvMIvk1GfGffp++b/Njde3UHZexF6XkZZW0F
 ngtwLFMiYVma8OB12LEb2izH5VP0fsjM7ZnhjPbH2wRj8aLrquDiwgllvIdyhsygsfG4
 jr54lr3cQRnpOhw9pTer4S+6j1/SOuO22HD2rlNEKfbgpO3Mp6isjPlSgCN8FZ923nDn
 eqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695369633; x=1695974433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NprMZCfk8vfqkafckCULVA3+3btHCTfBpJu0SPpDVfE=;
 b=wdByF5DvWTGvwtIEHM8PJh9+eBxjYg56o7PVFw2yQNK0gScvcSNkLcavbh6OF6hTbK
 ImQ53N9op6tgEtymPTtTYyH0uv0CTCogwhxHzvmbS9eJVvrHtnf/78TDpCCyxxk4PBbr
 RGtz/i+f5YEJuMeG9URu+S9w8JsrIgF7CG4BfvYlSKmDCwjd5Tkchn/ybTtIFqOHKXJn
 ajfcS6is0BuIc4rjGmZDQUjFaj1ipri1hphEe229M+eWr5N14XTtHTaanWrRkMrvfS6C
 GN9HyoT5ODRv3Brw8f/Ao2UEFui8SMaPTFuNzOtO6aaUVPOwewjYASkE/NLh05XgeCOQ
 viGw==
X-Gm-Message-State: AOJu0YxdKQzHKKU+iYVfVaChWOQ8l8UX0rFCe0JVoCvfhfaK4EAMaohA
 sk0X+BnRHhy50ImeLdqisqKqPcqhEYYhzOMyj9s0tw==
X-Google-Smtp-Source: AGHT+IGQZRhV08IW4GnVCFuKz9j5xLN7/Qte12FOb8z8jWXFkQSHP/kpUfIaPVqlQjrtdtlek15PWupfiPw1wJW9c/U=
X-Received: by 2002:a7b:cd07:0:b0:3fe:f32f:c57f with SMTP id
 f7-20020a7bcd07000000b003fef32fc57fmr50536wmj.0.1695369633354; Fri, 22 Sep
 2023 01:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-2-1a0fc261832d@riseup.net>
In-Reply-To: <20230920-kunit-kasan-fixes-v1-2-1a0fc261832d@riseup.net>
From: David Gow <davidgow@google.com>
Date: Fri, 22 Sep 2023 16:00:21 +0800
Message-ID: <CABVgOSk6cvPHs3CsoG0FgHz9Y1OT31ZCk=eu5cCOXyg03uNpBA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kunit: Add kunit_move_action_to_top_or_reset() to
 reorder actions
To: Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000c9fe760605ee0000"
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
Cc: mairacanal@riseup.net, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>, dri-devel@lists.freedesktop.org,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c9fe760605ee0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Sept 2023 at 14:12, Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> On Kunit, if we allocate a resource A and B on this order, with its
> deferred actions to free them. The resource stack would be something
> like this:
>
>          +---------+
>          | free(B) |
>          +---------+
>          |   ...   |
>          +---------+
>          | free(A) |
>          +---------+
>
> If the deferred action of A accesses B, this would cause a
> use-after-free bug. To solve that, we need a way to change the order
> of actions.
>
> Create a function to move an action to the top of the resource stack,
> as shown in the diagram below.
>
>          +---------+    +---------+
>          | free(B) |    | free(A) |
>          +---------+    +---------+
>          |   ...   | -> | free(B) |
>          +---------+    +---------+
>          | free(A) |    |   ...   |
>          +---------+    +---------+
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

Thanks. This is a really interesting patch: my hope was that something
like this wouldn't be necessary, as in most cases freeing things in
the reverse order to which they were created is the right thing to do.

It looks like, from the comments on patch 3, this may no longer be
necessary? Is that so?

Otherwise, if you have a real use case for it, I've no objection to
KUnit adding this as a feature (though I'd probably add some
documentation suggesting that it's best avoided if you can order your
allocations / calls better).

Cheers,
-- David

>  include/kunit/resource.h | 17 +++++++++++++++++
>  lib/kunit/resource.c     | 19 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/include/kunit/resource.h b/include/kunit/resource.h
> index c7383e90f5c9..c598b23680e3 100644
> --- a/include/kunit/resource.h
> +++ b/include/kunit/resource.h
> @@ -479,4 +479,21 @@ void kunit_remove_action(struct kunit *test,
>  void kunit_release_action(struct kunit *test,
>                           kunit_action_t *action,
>                           void *ctx);
> +
> +/**
> + * kunit_move_action_to_top_or_reset - Move a previously added action to the top
> + *                                    of the order of actions calls.
> + * @test: Test case to associate the action with.
> + * @action: The function to run on test exit
> + * @ctx: Data passed into @func
> + *
> + * Reorder the action stack, by moving the desired action to the top.
> + *
> + * Returns:
> + *   0 on success, an error if the action could not be inserted on the top.
> + */
> +int kunit_move_action_to_top_or_reset(struct kunit *test,
> +                                     kunit_action_t *action,
> +                                     void *ctx);
> +
>  #endif /* _KUNIT_RESOURCE_H */
> diff --git a/lib/kunit/resource.c b/lib/kunit/resource.c
> index f0209252b179..fe40a34b62a6 100644
> --- a/lib/kunit/resource.c
> +++ b/lib/kunit/resource.c
> @@ -176,3 +176,22 @@ void kunit_release_action(struct kunit *test,
>         }
>  }
>  EXPORT_SYMBOL_GPL(kunit_release_action);
> +
> +int kunit_move_action_to_top_or_reset(struct kunit *test,
> +                                     kunit_action_t *action,
> +                                     void *ctx)
> +{
> +       struct kunit_action_ctx match_ctx;
> +       struct kunit_resource *res;
> +
> +       match_ctx.func = action;
> +       match_ctx.ctx = ctx;
> +       res = kunit_find_resource(test, __kunit_action_match, &match_ctx);
> +       if (res) {
> +               kunit_remove_action(test, action, ctx);
> +               return kunit_add_action_or_reset(test, action, ctx);
> +       }
> +

if (!res), this doesn't call the action, so the _or_reset() part of
this doesn't quite make sense.

As I understand it, there are three cases handled here:
1. The action already existed, and we were able to recreate it at the top.
2. The action already existed, but we were unable to recreate it.
3. The action did not previously exist.

In this case, for (1), the action is successfully moved to the top.
This is the "good case".
For (2), we run the action immediately (the idea being that it's
better to not leak memory).
For (3), we do nothing, the action is never run.

My guess, from the name ending in _or_reset, (3) should:
- Try to defer the action. If deferring it fails, run the action immediately.

Or possibly, always run the action immediately in case (3).

Whatever we want, we need to decide on what happens here and document them.

And of course, we can get some of those behaviours without needing to
call kunit_find_resource() at all, just by calling
kunit_remove_action(...)
kunit_add_action_or_reset()
unconditionally.

> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(kunit_move_action_to_top_or_reset);
>
> --
> 2.41.0
>

--000000000000c9fe760605ee0000
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
ddIn9n5Jt6Z1o79zxraLMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBtHFwIgQZjer5K
H+4Q+wns10k7qN+4wN2Uf+JsyOYjukaMEgdLErfA1wwtQ9uHkoYQZcWBuVVkQFa5hI+sqI2m1Weq
riMCFSiU38s1tADdMX12IMfJRN60Nznhrw+nPyDRZqRhUTW24TwnHorkDnFPW8PHo7fAw4FrpI0n
impZAng7ccvvK09K3ZuhwTIxJMsPXCZYsrXWORTw5sczRAP6XvKbPBJnsJoSTe5dFBPBHOQJOGhU
qWfEfWnWMJPF3LxSGLpLFQXO3RwQqmxv08avwXfVPouh1xuB3FX7rpDabT8YDhu9JgIZkLEKko7L
yQt6zWwng7k8YF/jGbiAta6VMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCD+
HMlWgOatsOgN/fPJzVXnAZ6AjyVEpXFSTvrioFxPEzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA5MjIwODAwMzNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEACQ8DSLVA86tGJWUweagD
6StfrKRZR+FPBWvOEE1Ko1pMMkLD8PN4eshle9TpruGolw3j66c8k5ATj2YjhObhycqrZWzs3Cbl
wTIjaE4XioXindwn3ksR216BBFpTLRKAV7DjJ21o9KUzgxVgtGrXcb9uAMQakSoTtQFJrvzwNMUR
o7CxfdX90cppIQ+5hiiwrXj36fh9CW5W8ijpLEcqAFN30zXF1IdKl/F3LUrGdUoYRQYLpAEw3q9o
FDaZmidwyDdAW2jgiJg2JzBl6+ZI0KdNNSkc6UFT/nZF8GzrmHZKWb10cYRDXhLqRdI1kGuFGPTw
U7SGJSRJmOnQuTKjoA==
--000000000000c9fe760605ee0000--
