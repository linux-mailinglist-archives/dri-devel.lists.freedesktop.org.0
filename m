Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF6562355
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E39711A682;
	Thu, 30 Jun 2022 19:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16D11A682
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656618043;
 bh=NySaX5kMLuXWGMRaSgwbxoKzs0WHnjyKOtUs4wVPB7I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dP32pXXtwOZx/EV6E6i+D/6IJ7e7MmnfNLQij8FsTN092SUx6r6FZa01lhbLyLZ2u
 SG+AyUsi168wCSxNFaG2clh2RyILCoOKPKOplI0kEHbJvheG7QSuYvPktqXU8I5DsE
 8ZTnX+UpnyugT7NSRwrOSuULnTFt1i5eZY/O/pZU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.11]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1nR2V1126a-00g4Km; Thu, 30
 Jun 2022 21:40:43 +0200
Message-ID: <557f3600-7285-6951-37c9-75a30f978dbf@gmx.de>
Date: Thu, 30 Jun 2022 21:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] fbcon: Prevent that screen size is smaller than font
 size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-4-deller@gmx.de>
 <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1MvdSNU8P+yq7r6DiLQimz5ZfjLuWIJMfbdSaaZLo6oVxHABlo
 skBWNLiH0Atq+65SD28fBn9FtjbSovbrL3f4adJmZsi03oiiZHGoyBBe6fYvqNMW99H37k+
 9s7T3cpnGOyUFKsdFmzq/I0pvN2NfijfWz8norLigYgz5gNNZQ6Tzz+PqnHIyuJw7flstr4
 f4tjqBtACe6ZwYiEPfrnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HUzWwN5ge6M=:TDH9ud3paq46+faGKrvwQS
 fPK33PSGQZNB/pu1HF+FE+/T3LQYfJERbJQrgjwIOqfYoHoDAf+6QzOSUA33OWogxlX8kqeLP
 4jv/UVoSZMmZbugclXp4agvAeL/WsWIBtLOKLXJ0SpQSR9YNxmRuqKxahZSVcvs9qyyu93JMh
 bjHZwiIO0dzM8R4Q+P5u6aS1/zvAx1OYLef5pznoXGk+4bOZ2vH8+IlvWau8nDlsNSp/wKy++
 ag8EJKDlLIVMFU00NVZygsLN2kqXoU+U5RjveQVSMQyPoFAjHo4ZgkfGH2e5RS2mWU8Hw3xdT
 LbWDAay14fKMkCDVcjBTd7BYJ54jiT4rFsA9Ar1btokmdGKYoi7dxis4h+eMGi5meGcsloMQb
 4q1tt6l1G3vGSPv7CjdipwF0s/B325N151bfEKFp5QPC240M3zWOmgfH0b9OyNEbBiJBVMz7F
 QruRZd/3B8mCjudLa/VECmEV50bM6GO/x/jJLj3XeOQUYAHdh2SclIbnxUcRPQN53DJOlDYII
 L9YBRlR+QKFWx6nFbdeg9qWekPORoAsSMWc+gWq2C0sVEjrW8qUY/ZDGFxth0FPeFQE2VgkLo
 ZRtFGBFZy5k9ub8d06OypfLWPWByg+5iRt5qa0UQKcx1BnZ2FkYxT9kJYt4/hU1VFXrxb3uva
 2rNBALFSH/Xmb+HJ6kUXogvzvzD+x1GJ/MU64676cpXDo6PCGe8v3y4HXXMd2lxSnxYBvpeMV
 bSuioiMrfjBPX2usFcH+RTASUGJzBX6PhZTZca+lsMp0Tr1WdWJC5TUynnQRF8RuMsp+S8HLr
 RvpE6RKbKLkyxZkqGeUve2GA20ywWQkNY9zBnSLyMZ07waKB78MBukLUkS7YwHpjPLpiI6sQM
 01EQ6NBYD4SXLlK4gZXIEnu8GG33lW7vFNixtQlt4hS15NeV0m6CgFnydiGS8FzZJyu66FYTf
 SJhRpvbBpRnNNGMIfa8e3zQPfuiw58XlgNIh8q3THytk3M/E47bh2Toj56uWkYIQylkgyMwsz
 2mCQRozbL/v4Jx4W4pWKFduBO9UmnONkVn9pOxAioG5nRi5jaYSa55PXAH8fTho/pYPhx47IH
 71mJ/nNJX823uGQgxJ0++DfTOiUFfmDAauFAIIxkt51d3fBoKv6H2OkCQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 21:09, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
>> We need to prevent that users configure a screen size which is smaller =
than the
>> currently selected font size. Otherwise rendering chars on the screen w=
ill
>> access memory outside the graphics memory region.
>> This patch adds a new function fbcon_modechange_possible() which
>> implements this check and which later may be extended with other checks
>> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
>> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
>> for a too small screen size.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Thanks for your patch!
>
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2736,6 +2736,34 @@ void fbcon_update_vcs(struct fb_info *info, bool=
 all)
>>  }
>>  EXPORT_SYMBOL(fbcon_update_vcs);
>>
>> +/* let fbcon check if it supports a new screen resolution */
>> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_scre=
eninfo *var)
>> +{
>> +       struct fbcon_ops *ops =3D info->fbcon_par;
>> +       struct vc_data *vc;
>> +       int i;
>> +
>> +       WARN_CONSOLE_UNLOCKED();
>> +
>> +       if (!ops || ops->currcon < 0)
>> +               return -EINVAL;
>
> So if the virtual console is _not_ used as a text console, we refuse
> mode changes?

Right, this needs to be dropped.

Helge


>> +
>> +       /* prevent setting a screen size which is smaller than font siz=
e */
>> +       for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
>> +               vc =3D vc_cons[i].d;
>> +               if (!vc || vc->vc_mode !=3D KD_TEXT ||
>> +                          registered_fb[con2fb_map[i]] !=3D info)
>> +                       continue;
>> +
>> +               if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->x=
res, var->yres) ||
>> +                   vc->vc_font.height > FBCON_SWAP(var->rotate, var->y=
res, var->xres))
>> +                       return -EINVAL;
>> +       }
>
> IMHO this looks way too fragile, and we should fix the rendering code
> to handle cols =3D=3D 0 || rows =3D=3D 0 instead...

Long-term we might need both.
The code above will at least return EINVAL if users try it, while
the cols/rows=3D0 code just prevents rendering if it doesn't fit.

Helge

>
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(fbcon_modechange_possible);
>> +
>>  int fbcon_mode_deleted(struct fb_info *info,
>>                        struct fb_videomode *mode)
>>  {
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index e645b96d2700..324f726739c4 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1111,7 +1111,9 @@ static long do_fb_ioctl(struct fb_info *info, uns=
igned int cmd,
>>                         var.xres_virtual =3D var.xres;
>>                 if (var.yres_virtual < var.yres)
>>                         var.yres_virtual =3D var.yres;
>> -               ret =3D fb_set_var(info, &var);
>> +               ret =3D fbcon_modechange_possible(info, &var);
>> +               if (!ret)
>> +                       ret =3D fb_set_var(info, &var);
>>                 if (!ret)
>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVA=
TE_ALL);
>>                 unlock_fb_info(info);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds

