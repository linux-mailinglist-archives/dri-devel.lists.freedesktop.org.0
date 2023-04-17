Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE46E4ED0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 19:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402D710E419;
	Mon, 17 Apr 2023 17:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com
 [IPv6:2a00:1450:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65610E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 17:08:50 +0000 (UTC)
Received: by mail-ed1-x549.google.com with SMTP id
 4fb4d7f45d1cf-50470d68f1eso4257462a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681751328; x=1684343328;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+wMSTjBM6XDFKqEhVVM1Ro1UhqxD1E4n9B0V/7ysZ5o=;
 b=SuN5fnkVz6riTNk4KUxBswAZOaTpxWLe1rmJ0MU2Bhs0EEgC3J39U2PYpUp9ott5Bd
 O0IcdbJmo+SwRIPwQj6i7MpP5oZY1na478BD37bKaAZkbkt+aQICu7AIg5+A3wygNdP4
 HBNlAe5okMzn01OIaZUoxhn5m5cks+7bdqGUY8JarOwXdnLFaE6Mz02qnxWiIIMgPN+v
 qteg6wjU2dyrXSOJOXkdybauUsm6ug987TNiFpszNp75uc2ibkTBls0YC+PrO+vQzem1
 Pcwo0qDqjfe7tP00Uz03Jta4PxiTtpXbcmQA4GtoqYFG0KDWp6JuMTsKV1TgjiQ5SjK/
 GQEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681751328; x=1684343328;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+wMSTjBM6XDFKqEhVVM1Ro1UhqxD1E4n9B0V/7ysZ5o=;
 b=m9jqI+Y8kfJFU6YqJwjGRKGMZHdIDs26xlJKi+l9ocIvyEGiO3lE8zGJ3T4/udq9uM
 yKwrnURhg/UIXff8+HNqCFDPl5Ww4L3gHfkmkdslQWVehRqbDIDm5hCsoCoqbpuoV7F4
 nn+PTsHwBMTV3+DcukgtwmRaJNzhJCYfwb2DSMk5MOWJ0jaqlg5US1AWvqaeK3lseSYj
 GE0FWmrqwrIgKJIzLFDQcBWULwug1EyzIkPcT8yR8+4o8fhq9j4vOeytG2aidZaV4uN7
 fa+KDpwY5Ly7Us5qVZhg0fXavngozBUzl7qe7PyBcfHlPTdzq+IFXJhkgVH6yjdd3vCh
 qyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681751328; x=1684343328;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+wMSTjBM6XDFKqEhVVM1Ro1UhqxD1E4n9B0V/7ysZ5o=;
 b=LY6f1CRCiyjQwY5Oi1y2mkeqfl4fhk3i7v94gQz4VlJglKRmICk6bh3c1N/ZtENJF+
 1bHcJQheN5wOZe/d6ybS+OpMfjsJRGa/YDIJ8uMmlGIeJyOjNUHWUAtw1PeJBijjtQ8c
 VrBO3cszlhXtxUk8XsMJhVspJUEByxZG+CMmuEGxe+EMmX6IO0OvVe0Q2F3b+ceckZKx
 SyWooB5wrpDM85dbXf65swbYF1Rw/pXnmaJXWksdIprHFTmAbnuEA1qfWVuuzXconGxD
 6+G0/A3K2JG/aCd8JoFI/lf6ITdiYE+j3OSPv9rOZ1RU9FKpsmk0LECNiWYQfAzUfXo/
 JPEA==
X-Gm-Message-State: AAQBX9dqTfDSak+3iGrlK/NAbkYKfqZLfyAJ0kW513EtfFszCAnhIHWP
 2AX0cNB0G0eD5NZDLEpOhGOnwepO3occ6W63UcGNcEM=
X-Google-Smtp-Source: AKy350b3ELshu7iFyXFFh07UC9W0/WXTMFvBrZEd5x1SJi6lW5d4WFn7s4+XqIaK0b+gWjrwkztttJCKyjcWi9AGEFZi
MIME-Version: 1.0
X-Received: by 2002:a50:9eca:0:b0:506:34d8:c710 with SMTP id
 a68-20020a509eca000000b0050634d8c710mr7556934edf.3.1681751328196; Mon, 17 Apr
 2023 10:08:48 -0700 (PDT)
Auto-Submitted: auto-generated
Message-ID: <calendar-aff2aaae-0f0c-4753-b046-b1d3c315b21a@google.com>
Date: Mon, 17 Apr 2023 17:08:48 +0000
Subject: Canceled event: XDC 2023 A Corunha Spain @ Tue Oct 17 - Thu Oct 19,
 2023 (dri-devel@lists.freedesktop.org)
From: mario.kleiner.de@gmail.com
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="0000000000008491a305f98b3e1e"
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
Reply-To: mario.kleiner.de@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008491a305f98b3e1e
Content-Type: multipart/alternative; boundary="0000000000008491a105f98b3e1c"

--0000000000008491a105f98b3e1c
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjYW5jZWxlZC4NCg0KWERDIDIwMjMgQSBDb3J1bmhhIFNwYWlu
DQpUdWVzZGF5IE9jdCAxNyDigJMgVGh1cnNkYXkgT2N0IDE5LCAyMDIzDQoNCkpvaW4gd2l0aCBH
b29nbGUgTWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vYXpuLXV3ZnAtcGd3P2hzPTIyNA0K
DQoNCg0KDQpIZWxsbyENCg0KUmVnaXN0cmF0aW9uICYgQ2FsbCBmb3IgUHJvcG9zYWxzIGFyZSBu
b3cgb3BlbiBmb3IgWERDIDIwMjMsIHdoaWNoIHdpbGwNCnRha2UgcGxhY2Ugb24gT2N0b2JlciAx
Ny0xOSwgMjAyMy4NCg0KaHR0cHM6Ly94ZGMyMDIzLngub3JnDQoNCkFzIHVzdWFsLCB0aGUgY29u
ZmVyZW5jZSBpcyBmcmVlIG9mIGNoYXJnZSBhbmQgb3BlbiB0byB0aGUgZ2VuZXJhbA0KcHVibGlj
LiBJZiB5b3UgcGxhbiBvbiBhdHRlbmRpbmcsIHBsZWFzZSBtYWtlIHN1cmUgdG8gcmVnaXN0ZXIg
YXMgZWFybHkNCmFzIHBvc3NpYmxlIQ0KDQpJbiBvcmRlciB0byByZWdpc3RlciBhcyBhdHRlbmRl
ZSwgeW91IHdpbGwgdGhlcmVmb3JlIG5lZWQgdG8gcmVnaXN0ZXINCnZpYSB0aGUgWERDIHdlYnNp
dGUuDQoNCmh0dHBzOi8vaW5kaWNvLmZyZWVkZXNrdG9wLm9yZy9ldmVudC80L3JlZ2lzdHJhdGlv
bnMvDQoNCkluIGFkZGl0aW9uIHRvIHJlZ2lzdHJhdGlvbiwgdGhlIENmUCBpcyBub3cgb3BlbiBm
b3IgdGFsa3MsIHdvcmtzaG9wcw0KYW5kIGRlbW9zIGF0IFhEQyAyMDIzLiBXaGlsZSAuLi4NCg0K
T3JnYW5pemVyDQptYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbQ0KbWFyaW8ua2xlaW5lci5kZUBn
bWFpbC5jb20NCg0KR3Vlc3RzDQptYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbSAtIG9yZ2FuaXpl
cg0KZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCnhvcmctZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQphbWQtZ2Z4IGxpc3QNCmludGVsLWdmeA0KTm91dmVhdSBEZXYNCmJvYXJkQGZv
dW5kYXRpb24ueC5vcmcNCmxpYnJlLXNvYy1kZXZAbGlzdHMubGlicmUtc29jLm9yZw0KTUwgbWVz
YS1kZXYNCm1lbWJlcnNAeC5vcmcNCmZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmRy
b2lkYml0dGluQGdtYWlsLmNvbQ0Kd2F5bGFuZC1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CmRyaS1kZXZlbA0Kc2lnbGVzaWFzQGlnYWxpYS5jb20NCmV2ZW50c0BsaXN0cy54Lm9yZw0KQmli
YnkgSHNpZWggKOisnea/n+mBoCkNCkdhcmcsIFJvaGFuDQoNCg0Kfn4vL35+DQpJbnZpdGF0aW9u
IGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5k
YXIvDQoNCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3UgYXJlIGFuIGF0
dGVuZGVlIG9uIHRoZSBldmVudC4gVG8gIA0Kc3RvcCByZWNlaXZpbmcgZnV0dXJlIHVwZGF0ZXMg
Zm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4NCg0KRm9yd2FyZGluZyB0aGlzIGlu
dml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8g
IA0KdGhlIG9yZ2FuaXplciwgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIGludml0ZSBvdGhl
cnMgcmVnYXJkbGVzcyBvZiAgDQp0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIG1vZGlm
eSB5b3VyIFJTVlAuDQoNCkxlYXJuIG1vcmUgaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2Fs
ZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--0000000000008491a105f98b3e1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v149/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v130/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v96/WWXFlimHYg6H=
KI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span itemprop=3D"object" itemscope itemtype=3D"http://schem=
a.org/Event"><meta itemprop=3D"eventStatus" content=3D"http://schema.org/Ev=
entCancelled"/><span itemprop=3D"publisher" itemscope itemtype=3D"http://sc=
hema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar"/=
></span><meta itemprop=3D"eventId/googleCalendar" content=3D"65qeuuc9e0gll2=
5tq5r7e617p8"/><span style=3D"display: none; font-size: 1px; color: #fff; l=
ine-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity:=
 0; overflow: hidden;" itemprop=3D"name">XDC 2023 A Corunha Spain</span><sp=
an aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20231017">=
</time><time itemprop=3D"endDate" datetime=3D"20231020"></time></span><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" al=
ign=3D"center" style=3D"width:100%;" class=3D"body-container"><tbody><tr><t=
d style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=
=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height:16px;" aria=
-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif=
]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"present=
ation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td sty=
le=3D"background-color: #fce8e6;color: #2d0c0c;padding: 12px 32px; border-r=
adius: 8px;font-family: Roboto, sans-serif;font-size: 14px; line-height: 20=
px;text-align: left;" class=3D"info-bar-inner"><span style=3D"font-weight: =
700;">This event has been canceled.</span></td></tr></tbody></table><!--[if=
 mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"=
presentation"><tr><td height=3D"12" style=3D"height:12px;"><![endif]--><div=
 style=3D"height:12px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE=
]></td></tr></table><![endif]--><table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" c=
lass=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; border-radius:=
 8px; direction: rtl; font-size: 0; padding: 24px 32px; text-align: left; v=
ertical-align: top;" class=3D"main-container-inner"><!--[if mso | IE]><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><t=
r><![endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:top;=
width:37%;" ><![endif]--><div class=3D"column-per-37 outlook-group-fix" sty=
le=3D"font-size: 13px; text-align: left; direction: ltr; display: inline-bl=
ock; vertical-align: top; width: 100%;overflow: hidden; word-wrap: break-wo=
rd;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presen=
tation" width=3D"100%"><tbody><tr><td style=3D"vertical-align:top;padding:0=
;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presenta=
tion" width=3D"100%"><tr><td style=3D"font-size: 0; padding: 0; text-align:=
 left; word-break: break-word;;padding-bottom:28px;"><a href=3D"https://mee=
t.google.com/azn-uwfp-pgw?hs=3D224" class=3D"primary-button-text" style=3D"=
display: inline-block;font-family: &#39;Google Sans&#39;, Roboto, sans-seri=
f;font-size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line-heig=
ht-rule: exactly; text-decoration: none; text-transform: none; word-wrap: b=
reak-word; white-space: nowrap;color: #fff;font-weight: 700;white-space: no=
rmal;" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"display: inline-block"><tr><td align=
=3D"center" role=3D"presentation" valign=3D"middle" style=3D"background-col=
or: #1a73e8; cursor: auto; padding: 10px 25px; border: none; border-radius:=
 4px; margin: 0;" class=3D"primary-button"><!--[if mso]><a href=3D"https://=
meet.google.com/azn-uwfp-pgw?hs=3D224" class=3D"primary-button-text" target=
=3D"_blank"><![endif]--><span class=3D"primary-button-text" style=3D"font-f=
amily: &#39;Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter-sp=
acing: 0.25px; line-height: 20px; mso-line-height-rule: exactly; text-decor=
ation: none; text-transform: none; word-wrap: break-word; white-space: nowr=
ap;color: #fff;font-weight: 700;white-space: normal;">Join with Google Meet=
</span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr><tr><td=
 style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-wor=
d;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font=
-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-align: =
left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text"=
 style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight=
: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Meeting l=
ink</h2></td></tr></table><!-- Use grey text for the Meet link--><div><a st=
yle=3D"display: inline-block;;color: #70757a; text-decoration: none;" class=
=3D"secondary-text underline-on-hover" href=3D"https://meet.google.com/azn-=
uwfp-pgw?hs=3D224">meet.google.com/azn-uwfp-pgw</a></div></div></td></tr></=
table></td></tr></tbody></table></div><!--[if mso | IE]></td><![endif]--><!=
--[if mso | IE]><td class=3D"" style=3D"vertical-align:top;width:63%;paddin=
g-right:32px;" ><![endif]--><div class=3D"column-per-63 outlook-group-fix" =
style=3D"font-size: 13px; text-align: left; direction: ltr; display: inline=
-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap: break=
-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" width=3D"100%" class=3D"main-column-table-ltr" style=3D"padding-=
right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr><td class=3D=
"main-column-td" style=3D"padding:0; vertical-align:top;"><table border=3D"=
0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"=
 style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; padding: 0; =
text-align: left; word-break: break-word;;padding-bottom:24px;"><div style=
=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; f=
ont-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; te=
xt-decoration: none;" class=3D"primary-text" role=3D"presentation"><span>He=
llo!<br> <br>Registration &amp; Call for Proposals are now open for XDC 202=
3, which will<br>take place on October 17-19, 2023.<p><a href=3D"https://ww=
w.google.com/url?q=3Dhttps%3A%2F%2Fxdc2023.x.org&amp;sa=3DD&amp;ust=3D16821=
83280000000&amp;usg=3DAOvVaw3rtcZVo_O4CWdsfiMe_KRY" target=3D"_blank">https=
://xdc2023.x.org</a><br> <br>As usual, the conference is free of charge and=
 open to the general<br>public. If you plan on attending, please make sure =
to register as early<br>as possible!<br> <br>In order to register as attend=
ee, you will therefore need to register<br>via the XDC website.<br> <br><a =
href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Findico.freedesktop.org=
%2Fevent%2F4%2Fregistrations%2F&amp;sa=3DD&amp;ust=3D1682183280000000&amp;u=
sg=3DAOvVaw1OnC_fEsqrHhOfYN5hnH87" target=3D"_blank">https://indico.freedes=
ktop.org/event/4/registrations/</a><br> <br>In addition to registration, th=
e CfP is now open for talks, workshops<br>and demos at XDC 2023. While ...<=
/p></span><meta itemprop=3D"description" content=3D"Hello!
=20
Registration &amp; Call for Proposals are now open for XDC 2023, which will
take place on October 17-19, 2023.

https://xdc2023.x.org
=20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
=20
In order to register as attendee, you will therefore need to register
via the XDC website.
=20
https://indico.freedesktop.org/event/4/registrations/
=20
In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2023. While ..."/></div></td></tr><tr><td style=3D"font-si=
ze: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom=
:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; f=
ont-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;=
color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pres=
entation"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=
=3D"20231017"></time><time itemprop=3D"endDate" datetime=3D"20231020"></tim=
e></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-tex=
t" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weig=
ht: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h=
2></td></tr></table><span>Tuesday Oct 17 =E2=80=93 Thursday Oct 19, 2023</s=
pan></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: =
left; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-fami=
ly: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14p=
x; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration=
: none;" class=3D"primary-text" role=3D"presentation"><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-b=
ottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;co=
lor: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothing=
: antialiased;margin: 0; padding: 0;">Guests</h2></td></tr></table><div sty=
le=3D"padding-bottom: 4px; text-align: left;;color: #3c4042;"><div><span it=
emprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span i=
temprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-o=
n-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration: n=
one;" href=3D"mailto:mario.kleiner.de@gmail.com">mario.kleiner.de@gmail.com=
</a></span><meta itemprop=3D"email" content=3D"mario.kleiner.de@gmail.com"/=
></span><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.or=
g/Person"><meta itemprop=3D"name" content=3D"mario.kleiner.de@gmail.com"/><=
meta itemprop=3D"email" content=3D"mario.kleiner.de@gmail.com"/></span><spa=
n class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"=
> - organizer</span></div><div><span itemprop=3D"attendee" itemscope itemty=
pe=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslat=
e"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bl=
ock;;color: #3c4043; text-decoration: none;" href=3D"mailto:etnaviv@lists.f=
reedesktop.org">etnaviv@lists.freedesktop.org</a></span><meta itemprop=3D"e=
mail" content=3D"etnaviv@lists.freedesktop.org"/></span><span class=3D"seco=
ndary-text" style=3D"color: #70757a; text-decoration: none;"></span></div><=
div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Per=
son"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text=
 underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-d=
ecoration: none;" href=3D"mailto:xorg-devel@lists.freedesktop.org">xorg-dev=
el@lists.freedesktop.org</a></span><meta itemprop=3D"email" content=3D"xorg=
-devel@lists.freedesktop.org"/></span><span class=3D"secondary-text" style=
=3D"color: #70757a; text-decoration: none;"></span></div><div><span itempro=
p=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempr=
op=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hov=
er" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;"=
 href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx list</a></span><meta=
 itemprop=3D"email" content=3D"amd-gfx@lists.freedesktop.org"/></span><span=
 class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;">=
</span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://=
schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=
=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color:=
 #3c4043; text-decoration: none;" href=3D"mailto:intel-gfx@lists.freedeskto=
p.org">intel-gfx</a></span><meta itemprop=3D"email" content=3D"intel-gfx@li=
sts.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color:=
 #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atten=
dee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name=
" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:nouveau@lists.freedesktop.org">Nouveau Dev</a></span><meta itemprop=
=3D"email" content=3D"nouveau@lists.freedesktop.org"/></span><span class=3D=
"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span></=
div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.or=
g/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary=
-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; t=
ext-decoration: none;" href=3D"mailto:board@foundation.x.org">board@foundat=
ion.x.org</a></span><meta itemprop=3D"email" content=3D"board@foundation.x.=
org"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-d=
ecoration: none;"></span></div><div><span itemprop=3D"attendee" itemscope i=
temtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notra=
nslate"><a class=3D"primary-text underline-on-hover" style=3D"display: inli=
ne-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:libre-soc-=
dev@lists.libre-soc.org">libre-soc-dev@lists.libre-soc.org</a></span><meta =
itemprop=3D"email" content=3D"libre-soc-dev@lists.libre-soc.org"/></span><s=
pan class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none=
;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a clas=
s=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color=
: #3c4043; text-decoration: none;" href=3D"mailto:mesa-dev@lists.freedeskto=
p.org">ML mesa-dev</a></span><meta itemprop=3D"email" content=3D"mesa-dev@l=
ists.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:members@x.org">members@x.org</a></span><meta itemprop=3D"email" cont=
ent=3D"members@x.org"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:freedreno@lists.freedesktop.org">freedreno@lists.freedesktop.org</a>=
</span><meta itemprop=3D"email" content=3D"freedreno@lists.freedesktop.org"=
/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-decor=
ation: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-b=
lock;;color: #3c4043; text-decoration: none;" href=3D"mailto:droidbittin@gm=
ail.com">droidbittin@gmail.com</a></span><meta itemprop=3D"email" content=
=3D"droidbittin@gmail.com"/></span><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D=
"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=
=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover=
" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;" h=
ref=3D"mailto:wayland-devel@lists.freedesktop.org">wayland-devel@lists.free=
desktop.org</a></span><meta itemprop=3D"email" content=3D"wayland-devel@lis=
ts.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color: =
#70757a; text-decoration: none;"></span></div><div><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:dri-devel@lists.freedesktop.org">dri-devel</a></span><meta itemprop=
=3D"email" content=3D"dri-devel@lists.freedesktop.org"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span=
></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"prim=
ary-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043=
; text-decoration: none;" href=3D"mailto:siglesias@igalia.com">siglesias@ig=
alia.com</a></span><meta itemprop=3D"email" content=3D"siglesias@igalia.com=
"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-deco=
ration: none;"></span></div><div><span itemprop=3D"attendee" itemscope item=
type=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransl=
ate"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-=
block;;color: #3c4043; text-decoration: none;" href=3D"mailto:events@lists.=
x.org">events@lists.x.org</a></span><meta itemprop=3D"email" content=3D"eve=
nts@lists.x.org"/></span><span class=3D"secondary-text" style=3D"color: #70=
757a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee"=
 itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" cl=
ass=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"d=
isplay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailt=
o:bibby.hsieh@mediatek.com">Bibby Hsieh (=E8=AC=9D=E6=BF=9F=E9=81=A0)</a></=
span><meta itemprop=3D"email" content=3D"bibby.hsieh@mediatek.com"/></span>=
<span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: no=
ne;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"ht=
tp://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a cl=
ass=3D"primary-text underline-on-hover" style=3D"display: inline-block;;col=
or: #3c4043; text-decoration: none;" href=3D"mailto:rohan.garg@intel.com">G=
arg, Rohan</a></span><meta itemprop=3D"email" content=3D"rohan.garg@intel.c=
om"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-de=
coration: none;"></span></div></div></div></td></tr></table></td></tr></tbo=
dy></table></div><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]></tr>=
</table><![endif]--></td></tr></tbody></table><table border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"=
width:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; padding: 0; t=
ext-align: left; word-break: break-word;;padding:4px 12px;" class=3D"" alig=
n=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a; text-deco=
ration: none;font-family: Roboto, sans-serif;font-size: 12px; line-height: =
16px; mso-line-height-rule: exactly; text-align: left;"><p>Invitation from =
<a href=3D"https://calendar.google.com/calendar/" class=3D"accent-text unde=
rline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; l=
ine-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decor=
ation: none;" target=3D"_blank">Google Calendar</a></p><p>You are receiving=
 this email because you are an attendee on the event. To stop receiving fut=
ure updates for this event, decline this event.</p><p>Forwarding this invit=
ation could allow any recipient to send a response to the organizer, be add=
ed to the guest list, invite others regardless of their own invitation stat=
us, or modify your RSVP. <a class=3D"accent-text underline-on-hover" style=
=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso=
-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;" href=3D=
"https://support.google.com/calendar/answer/37135#forwarding">Learn more</a=
></p></div></td></tr></tbody></table></td></tr></tbody></table></span></spa=
n></body></html>
--0000000000008491a105f98b3e1c
Content-Type: text/calendar; charset="UTF-8"; method=CANCEL
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:CANCEL
BEGIN:VEVENT
DTSTART;VALUE=DATE:20231017
DTEND;VALUE=DATE:20231020
DTSTAMP:20230417T170848Z
ORGANIZER;CN=mario.kleiner.de@gmail.com:mailto:mario.kleiner.de@gmail.com
UID:65qeuuc9e0gll25tq5r7e617p8@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=et
 naviv@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:etnaviv@lists.freedesktop
 .org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=xo
 rg-devel@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:xorg-devel@lists.freed
 esktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=am
 d-gfx list;X-NUM-GUESTS=0:mailto:amd-gfx@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=in
 tel-gfx;X-NUM-GUESTS=0:mailto:intel-gfx@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=No
 uveau Dev;X-NUM-GUESTS=0:mailto:nouveau@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;CN=mario.
 kleiner.de@gmail.com;X-NUM-GUESTS=0:mailto:mario.kleiner.de@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=bo
 ard@foundation.x.org;X-NUM-GUESTS=0:mailto:board@foundation.x.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=li
 bre-soc-dev@lists.libre-soc.org;X-NUM-GUESTS=0:mailto:libre-soc-dev@lists.l
 ibre-soc.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=ML
  mesa-dev;X-NUM-GUESTS=0:mailto:mesa-dev@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=me
 mbers@x.org;X-NUM-GUESTS=0:mailto:members@x.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=fr
 eedreno@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:freedreno@lists.freedes
 ktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=dr
 oidbittin@gmail.com;X-NUM-GUESTS=0:mailto:droidbittin@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=wa
 yland-devel@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:wayland-devel@lists
 .freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=dr
 i-devel;X-NUM-GUESTS=0:mailto:dri-devel@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=si
 glesias@igalia.com;X-NUM-GUESTS=0:mailto:siglesias@igalia.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=ev
 ents@lists.x.org;X-NUM-GUESTS=0:mailto:events@lists.x.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;X-NUM
 -GUESTS=0:mailto:bibby.hsieh@mediatek.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN="G
 arg, Rohan";X-NUM-GUESTS=0:mailto:rohan.garg@intel.com
X-GOOGLE-CONFERENCE:https://meet.google.com/azn-uwfp-pgw
CREATED:20230417T170310Z
DESCRIPTION:Hello!\n \nRegistration & Call for Proposals are now open for X
 DC 2023\, which will\ntake place on October 17-19\, 2023.\n\nhttps://xdc202
 3.x.org\n \nAs usual\, the conference is free of charge and open to the gen
 eral\npublic. If you plan on attending\, please make sure to register as ea
 rly\nas possible!\n \nIn order to register as attendee\, you will therefore
  need to register\nvia the XDC website.\n \nhttps://indico.freedesktop.org/
 event/4/registrations/\n \nIn addition to registration\, the CfP is now ope
 n for talks\, workshops\nand demos at XDC 2023. While ...\n\n-::~:~::~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\n
 Join with Google Meet: https://meet.google.com/azn-uwfp-pgw\n\nLearn more a
 bout Meet at: https://support.google.com/a/users/answer/9282720\n\nPlease d
 o not edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20230417T170847Z
LOCATION:
SEQUENCE:1
STATUS:CANCELLED
SUMMARY:XDC 2023 A Corunha Spain
TRANSP:TRANSPARENT
END:VEVENT
END:VCALENDAR

--0000000000008491a105f98b3e1c--

--0000000000008491a305f98b3e1e
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6Q0FOQ0VM
DQpCRUdJTjpWRVZFTlQNCkRUU1RBUlQ7VkFMVUU9REFURToyMDIzMTAxNw0KRFRFTkQ7VkFMVUU9
REFURToyMDIzMTAyMA0KRFRTVEFNUDoyMDIzMDQxN1QxNzA4NDhaDQpPUkdBTklaRVI7Q049bWFy
aW8ua2xlaW5lci5kZUBnbWFpbC5jb206bWFpbHRvOm1hcmlvLmtsZWluZXIuZGVAZ21haWwuY29t
DQpVSUQ6NjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDhAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O0NOPWV0DQogbmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnO1gtTlVNLUdVRVNUUz0wOm1haWx0
bzpldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wDQogLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElW
SURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPXhvDQog
cmctZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnO1gtTlVNLUdVRVNUUz0wOm1haWx0bzp4b3Jn
LWRldmVsQGxpc3RzLmZyZWVkDQogZXNrdG9wLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURV
QUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPWFtDQogZC1n
ZnggbGlzdDtYLU5VTS1HVUVTVFM9MDptYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRT
VEFUPU5FRURTLUFDVElPTjtDTj1pbg0KIHRlbC1nZng7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFM
O1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtDTj1Obw0KIHV2ZWF1
IERldjtYLU5VTS1HVUVTVFM9MDptYWlsdG86bm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PUFDQ0VQVEVEO0NOPW1hcmlvLg0KIGtsZWluZXIuZGVAZ21haWwuY29tO1gtTlVNLUdVRVNUUz0w
Om1haWx0bzptYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElW
SURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPWJvDQog
YXJkQGZvdW5kYXRpb24ueC5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmJvYXJkQGZvdW5kYXRp
b24ueC5vcmcNCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtDTj1saQ0KIGJyZS1zb2MtZGV2QGxpc3RzLmxpYnJlLXNv
Yy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmxpYnJlLXNvYy1kZXZAbGlzdHMubA0KIGlicmUt
c29jLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPU1MDQogIG1lc2EtZGV2O1gtTlVNLUdVRVNUUz0wOm1h
aWx0bzptZXNhLWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkFUVEVOREVFO0NVVFlQRT1JTkRJ
VklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtDTj1tZQ0K
IG1iZXJzQHgub3JnO1gtTlVNLUdVRVNUUz0wOm1haWx0bzptZW1iZXJzQHgub3JnDQpBVFRFTkRF
RTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1B
Q1RJT047Q049ZnINCiBlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZztYLU5VTS1HVUVTVFM9
MDptYWlsdG86ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXMNCiBrdG9wLm9yZw0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O0NOPWRyDQogb2lkYml0dGluQGdtYWlsLmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86ZHJvaWRi
aXR0aW5AZ21haWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047Q049d2ENCiB5bGFuZC1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOndheWxhbmQtZGV2ZWxAbGlzdHMN
CiAuZnJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047Q049ZHINCiBpLWRldmVsO1gtTlVNLUdV
RVNUUz0wOm1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtD
VVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJ
T047Q049c2kNCiBnbGVzaWFzQGlnYWxpYS5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnNpZ2xl
c2lhc0BpZ2FsaWEuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047Q049ZXYNCiBlbnRzQGxpc3RzLngub3JnO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzpldmVudHNAbGlzdHMueC5vcmcNCkFUVEVOREVFO0NVVFlQRT1J
TkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtYLU5V
TQ0KIC1HVUVTVFM9MDptYWlsdG86YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tDQpBVFRFTkRFRTtD
VVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJ
T047Q049IkcNCiBhcmcsIFJvaGFuIjtYLU5VTS1HVUVTVFM9MDptYWlsdG86cm9oYW4uZ2FyZ0Bp
bnRlbC5jb20NClgtR09PR0xFLUNPTkZFUkVOQ0U6aHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vYXpu
LXV3ZnAtcGd3DQpDUkVBVEVEOjIwMjMwNDE3VDE3MDMxMFoNCkRFU0NSSVBUSU9OOkhlbGxvIVxu
IFxuUmVnaXN0cmF0aW9uICYgQ2FsbCBmb3IgUHJvcG9zYWxzIGFyZSBub3cgb3BlbiBmb3IgWA0K
IERDIDIwMjNcLCB3aGljaCB3aWxsXG50YWtlIHBsYWNlIG9uIE9jdG9iZXIgMTctMTlcLCAyMDIz
LlxuXG5odHRwczovL3hkYzIwMg0KIDMueC5vcmdcbiBcbkFzIHVzdWFsXCwgdGhlIGNvbmZlcmVu
Y2UgaXMgZnJlZSBvZiBjaGFyZ2UgYW5kIG9wZW4gdG8gdGhlIGdlbg0KIGVyYWxcbnB1YmxpYy4g
SWYgeW91IHBsYW4gb24gYXR0ZW5kaW5nXCwgcGxlYXNlIG1ha2Ugc3VyZSB0byByZWdpc3RlciBh
cyBlYQ0KIHJseVxuYXMgcG9zc2libGUhXG4gXG5JbiBvcmRlciB0byByZWdpc3RlciBhcyBhdHRl
bmRlZVwsIHlvdSB3aWxsIHRoZXJlZm9yZQ0KICBuZWVkIHRvIHJlZ2lzdGVyXG52aWEgdGhlIFhE
QyB3ZWJzaXRlLlxuIFxuaHR0cHM6Ly9pbmRpY28uZnJlZWRlc2t0b3Aub3JnLw0KIGV2ZW50LzQv
cmVnaXN0cmF0aW9ucy9cbiBcbkluIGFkZGl0aW9uIHRvIHJlZ2lzdHJhdGlvblwsIHRoZSBDZlAg
aXMgbm93IG9wZQ0KIG4gZm9yIHRhbGtzXCwgd29ya3Nob3BzXG5hbmQgZGVtb3MgYXQgWERDIDIw
MjMuIFdoaWxlIC4uLlxuXG4tOjp+On46On46fjp+Og0KIH46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi1cbg0KIEpv
aW4gd2l0aCBHb29nbGUgTWVldDogaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vYXpuLXV3ZnAtcGd3
XG5cbkxlYXJuIG1vcmUgYQ0KIGJvdXQgTWVldCBhdDogaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5j
b20vYS91c2Vycy9hbnN3ZXIvOTI4MjcyMFxuXG5QbGVhc2UgZA0KIG8gbm90IGVkaXQgdGhpcyBz
ZWN0aW9uLlxuLTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fg0KIDp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjo6fjp+OjotDQpMQVNULU1PRElGSUVE
OjIwMjMwNDE3VDE3MDg0N1oNCkxPQ0FUSU9OOg0KU0VRVUVOQ0U6MQ0KU1RBVFVTOkNBTkNFTExF
RA0KU1VNTUFSWTpYREMgMjAyMyBBIENvcnVuaGEgU3BhaW4NClRSQU5TUDpUUkFOU1BBUkVOVA0K
RU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--0000000000008491a305f98b3e1e--
